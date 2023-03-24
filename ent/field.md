

```
func (User) Fields() []ent.Field {
    return []ent.Field{
        field.Int("age").
            Positive(),
        field.Float("rank").
            Optional(),
        field.Bool("active").
            Default(false),
        field.String("name").
            Match(regexp.MustCompile("[a-zA-Z_]+$")).
            Validate(func(s string) error {
                if strings.ToLower(s) == s {
                    return errors.New("group name must begin with uppercase")
                }
                return nil
            }),
        field.Time("created_at").
            Default(time.Now),
        field.JSON("url", &url.URL{}).
            Optional(),
        field.JSON("strings", []string{}).
            Optional(),
        field.Enum("state").
            Values("on", "off").
            Optional(),
        field.Time("created_at").
            Default(time.Now),
        field.Time("updated_at").
            Default(time.Now).
            UpdateDefault(time.Now),
    }
}
```

