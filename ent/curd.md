

- create

```
a8m, err := client.User.    // UserClient.
    Create().                // User create builder.
    SetName("a8m").            // Set field value.
    SetNillableAge(age).    // Avoid nil checks.
    AddGroups(g1, g2).        // Add many edges.
    SetSpouse(nati).         // Set unique edge.
    Save(ctx)                // Create and return.
```

- update

```
a8m, err = a8m.Update().    // User update builder.
    RemoveGroup(g2).        // Remove specific edge.
    ClearCard().            // Clear unique edge.
    SetAge(30).             // Set field value
    Save(ctx)               // Save and return.
```

- update by id

```
pedro, err := client.Pet.    // PetClient.
    UpdateOneID(id).        // Pet update builder.
    SetName("pedro").        // Set field name.
    SetOwnerID(owner).        // Set unique edge, using id.
    Save(ctx)                // Save and return.
```