## Horse

Attribute | Type | Mandatory | Default | Pattern | Description
--- | :---: | :---: | :---: | --- | ---
id | integer | Yes |  |  | On importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute
name | string | Yes |  |  | 
horse_no | integer | No |  |  | Unless horse no is given, all newly imported horses will be sorted by name and given a number automatic, that is preferable
born_year | string | No |  | \A\d{4}\z | 4-digits birth year
sex | string | No | "unknown" |  | S = Stallion, G = Gelding, M = Mare, unknown = Unknown
category | string | No | "H" |  | H = Horse, A, B, C, D, E, 1, 2 or 3
licence | string | No |  |  | National licence
licence_year | string or integer | No |  | \A\d{4}\z | The year licence is valid. 4 digits
fei_id | string | No | "" |  | 
country | string | No | "" |  | The IOC code for the country in which the horse was born
color | string | No | "" |  | 
breed | string | No | "" |  | Stud book of the horse in short, e.g. SWB or HANN
race | string | No | "" |  | 
height | string | No | "" |  | 
reg_no | string | No | "" |  | Registration number of the horse
breeder | string | No | "" |  | Breeder of the horse
owner | string | No | "" |  | Current owner of the horse
sire | string | No | "" |  | 
dam | string | No | "" |  | 
dams_dam | string | No | "" |  | 
dam_sire | string | No | "" |  | 
dams_damsire | string | No | "" |  | 
notes | string | No | "" |  | 
custom_fields | object | No |  |  | The object key refers to the key in [custom_field_names](SHOW.md) on show