# user group cars



- user
```
type User struct {
    ent.Schema
}

func (User) Fields() []ent.Field {
    return []ent.Field{
        field.Int("age").
            Positive(),
        field.String("name").
            Default("unknown"),
    }
}

func (User) Edges() []ent.Edge {
    return []ent.Edge{
       edge.To("cars", Car.Type),
       edge.From("groups", Group.Type).
           Ref("users"),
   }
}
```

- car

```
func (Car) Fields() []ent.Field {
    return []ent.Field{
        field.String("model"),
        field.Time("registered_at"),
    }
}

func (Car) Edges() []ent.Edge {
    return []ent.Edge{
        edge.From("owner", User.Type).
            Ref("cars").
            Unique(),
    }
}
```

- group

```
func (Group) Fields() []ent.Field {
    return []ent.Field{
        field.String("name").
            Match(regexp.MustCompile("[a-zA-Z_]+$")),
    }
}

func (Group) Edges() []ent.Edge {
   return []ent.Edge{
       edge.To("users", User.Type),
   }
}
```


- Create Your First Entity

```
func CreateCars(ctx context.Context, client *ent.Client) (*ent.User, error) {
    // Create a new car with model "Tesla".
    tesla, err := client.Car.
        Create().
        SetModel("Tesla").
        SetRegisteredAt(time.Now()).
        Save(ctx)
    if err != nil {
        return nil, fmt.Errorf("failed creating car: %w", err)
    }
    log.Println("car was created: ", tesla)

    // Create a new car with model "Ford".
    ford, err := client.Car.
        Create().
        SetModel("Ford").
        SetRegisteredAt(time.Now()).
        Save(ctx)
    if err != nil {
        return nil, fmt.Errorf("failed creating car: %w", err)
    }
    log.Println("car was created: ", ford)

    // Create a new user, and add it the 2 cars.
    a8m, err := client.User.
        Create().
        SetAge(30).
        SetName("a8m").
        AddCars(tesla, ford).
        Save(ctx)
    if err != nil {
        return nil, fmt.Errorf("failed creating user: %w", err)
    }
    log.Println("user was created: ", a8m)
    return a8m, nil
}
```

- Query Your Entities


```
func QueryUser(ctx context.Context, client *ent.Client) (*ent.User, error) {
    u, err := client.User.
        Query().
        Where(user.Name("a8m")).
        // `Only` fails if no user found,
        // or more than 1 user returned.
        Only(ctx)
    if err != nil {
        return nil, fmt.Errorf("failed querying user: %w", err)
    }
    log.Println("user returned: ", u)
    return u, nil
}
```


- Graph Traversal

```
func CreateGraph(ctx context.Context, client *ent.Client) error {
    // First, create the users.
    a8m, err := client.User.
        Create().
        SetAge(30).
        SetName("Ariel").
        Save(ctx)
    if err != nil {
        return err
    }
    neta, err := client.User.
        Create().
        SetAge(28).
        SetName("Neta").
        Save(ctx)
    if err != nil {
        return err
    }
    // Then, create the cars, and attach them to the users created above.
    err = client.Car.
        Create().
        SetModel("Tesla").
        SetRegisteredAt(time.Now()).
        // Attach this car to Ariel.
        SetOwner(a8m).
        Exec(ctx)
    if err != nil {
        return err
    }
    err = client.Car.
        Create().
        SetModel("Mazda").
        SetRegisteredAt(time.Now()).
        // Attach this car to Ariel.
        SetOwner(a8m).
        Exec(ctx)
    if err != nil {
        return err
    }
    err = client.Car.
        Create().
        SetModel("Ford").
        SetRegisteredAt(time.Now()).
        // Attach this graph to Neta.
        SetOwner(neta).
        Exec(ctx)
    if err != nil {
        return err
    }
    // Create the groups, and add their users in the creation.
    err = client.Group.
        Create().
        SetName("GitLab").
        AddUsers(neta, a8m).
        Exec(ctx)
    if err != nil {
        return err
    }
    err = client.Group.
        Create().
        SetName("GitHub").
        AddUsers(a8m).
        Exec(ctx)
    if err != nil {
        return err
    }
    log.Println("The graph was created successfully")
    return nil
}
```



- list car by group 

```
func QueryGithub(ctx context.Context, client *ent.Client) error {
    cars, err := client.Group.
        Query().
        Where(group.Name("GitHub")). // (Group(Name=GitHub),)
        QueryUsers().                // (User(Name=Ariel, Age=30),)
        QueryCars().                 // (Car(Model=Tesla, RegisteredAt=<Time>), Car(Model=Mazda, RegisteredAt=<Time>),)
        All(ctx)
    if err != nil {
        return fmt.Errorf("failed getting cars: %w", err)
    }
    log.Println("cars returned:", cars)
    // Output: (Car(Model=Tesla, RegisteredAt=<Time>), Car(Model=Mazda, RegisteredAt=<Time>),)
    return nil
}
```


- list car by user

```
func QueryArielCars(ctx context.Context, client *ent.Client) error {
    // Get "Ariel" from previous steps.
    a8m := client.User.
        Query().
        Where(
            user.HasCars(),
            user.Name("Ariel"),
        ).
        OnlyX(ctx)
    cars, err := a8m.                       // Get the groups, that a8m is connected to:
            QueryGroups().                  // (Group(Name=GitHub), Group(Name=GitLab),)
            QueryUsers().                   // (User(Name=Ariel, Age=30), User(Name=Neta, Age=28),)
            QueryCars().                    //
            Where(                          //
                car.Not(                    //  Get Neta and Ariel cars, but filter out
                    car.Model("Mazda"),     //  those who named "Mazda"
                ),                          //
            ).                              //
            All(ctx)
    if err != nil {
        return fmt.Errorf("failed getting cars: %w", err)
    }
    log.Println("cars returned:", cars)
    // Output: (Car(Model=Tesla, RegisteredAt=<Time>), Car(Model=Ford, RegisteredAt=<Time>),)
    return nil
}
```