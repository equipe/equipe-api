## Start

Attribute | Type | Mandatory | Default | Pattern | Description
--- | :---: | :---: | :---: | --- | ---
id | integer | Yes |  |  | When importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute
competition_no | string | No |  |  | Competition no, the competition must exist in competitions
rider_id | integer | Yes |  |  | ID of the rider, the rider must exist in people
payer_id | integer | No |  |  | ID of the payer, the payer must exist in people
horse_id | integer | No |  |  | ID of the horse, the horse must exist in people
category | string | No | "H" |  | One of <ul><li>H</li><li>A</li><li>B</li><li>C</li><li>D</li><li>E</li><li>1</li><li>2</li><li>3</li></ul>
section | string | No | "A" |  | A = Section A, B = Section B (Young horses)
late_entry | boolean | No | false |  | When true, the late entry fee will be applied
status | string | No | "" |  | One of <ul><li></li><li>withdrawn</li><li>unpaid</li><li>no_show</li><li>changed</li><li>reserve</li><li>starting</li></ul>
outside_comp | boolean | No | false |  | When true, this start will not be ranked
custom_fields | object | No |  |  | The object key refers to the key in [custom_field_names](SHOW.md) on show