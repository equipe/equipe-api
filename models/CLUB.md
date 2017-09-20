## Club

Attribute | Type | Mandatory | Default | Pattern | Description
--- | :---: | :---: | :---: | --- | ---
id | integer | Yes |  |  | On importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute
name | string | Yes |  |  | 
short | string | No |  |  | 
logo_id | string | No |  |  | Refers to our central repository for logos which are shared between all our systems. When logo_id is a number and less then 4 digits, prefix it with zero. Example 54 should be 0054
logo_group | string | No |  |  | 

**Example record of Club**
```json
{
  "id":10001,
  "name":"Helsingborgs Fältrittklubb",
  "short":"HFRK",
  "logo_id":"0235",
  "logo_group":"svrf"
}

```