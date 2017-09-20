## Custom entry fee

Attribute | Type | Mandatory | Default | Pattern | Description
--- | :---: | :---: | :---: | --- | ---
name | string | Yes |  |  | Name of the fee
vat | number | Yes |  |  | VAT included by %
amount | number | Yes |  |  | The amount including VAT

**Example record of Custom entry fee**
```json
[
  {
    "name":"Stable service",
    "vat":20,
    "amount":320
  }
]

```