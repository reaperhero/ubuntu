


Built-in Validators


The framework provides a few built-in validators for each type:

Numeric types:

```
Positive()
Negative()
NonNegative()
Min(i) - Validate that the given value is > i.
Max(i) - Validate that the given value is \< i.
Range(i, j) - Validate that the given value is within the range [i, j].
```

string
```
MinLen(i)
MaxLen(i)
Match(regexp.Regexp)
NotEmpty
```

[]byte
```
MaxLen(i)
MinLen(i)
NotEmpty
```


- usage


```
func (Class) Fields() []ent.Field {
	return []ent.Field{
		field.String("name").MaxLen(50).Comment("名称"),
		field.Int("level").Comment("级别"),
	}
}
```