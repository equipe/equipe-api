# Equipe Rest API

## Request bodies

The endpoints below take the attributes of a write request wrapped in the name
of the resource — `{"person": {...}}`, `{"payment": {...}}` — sent as
`Content-Type: application/json`.

Without the wrapper the request still succeeds, but Equipe adds the wrapper for
you and keeps only the fields it already knows about; anything else is dropped
before it reaches the endpoint, with no error. As long as the body still carries
one field Equipe recognises, a misspelled field name is answered with `200 OK`
and simply has no effect. Misspell every field in the body and there is nothing
left to wrap, which is answered with `422` and
`{"errors":{"person":["can't be blank"]}}`.

Wrapping the body yourself is what puts your own field names in front of the
endpoint. What the endpoint then does with a name it does not know differs
between the two:

- `PATCH .../people/{{person_id}}` rejects it. `{"person": {"first_name": "Jon",
  "lsat_name": "Stenqvist"}}` fails with `500` — an unknown attribute
  `lsat_name` — rather than reporting success and changing nothing.
- `POST .../economies/payments` still ignores it. `{"payment": {"account":
  "bank", "direction": "in", "amount": 340, "descriptoin": "Betalning"}}` is
  answered with `201 Created` and stores an empty description. Wrapping that
  body is worth doing for a different reason: `direction` is not a stored field,
  so it is one of the keys the automatic wrapping discards — see
  [Create a payment for person](#create-a-payment-for-person).

## People

A person is identified by `rnr`. As with horses below, every field has a
readable name and a stored column name, and a single person answers with
both. `last_name` and `efternamn` are the same value, so are `email` and
`epost`. Use the readable ones. You can write with either.

The list is older than that and mixes the two. Some fields come under the
readable name, some under the stored one, and the mobile number under both.
A single person is the one to trust.

### List people

```http
GET /meetings/{{meeting_id}}/people HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json
Content-Type: application/json

[
  {
    "rnr": 10013,
    "internet_rnr": null,
    "name": "Jitendarjit Singh Ahluwalia",
    "name_order": "Ahluwalia Jitendarjit Singh",
    "address": "",
    "zipcode": "",
    "city": "",
    "cell_phone": "",
    "horse_names": "Akira",
    "horse_pm": false,
    "country": "IND",
    "knr": null,
    "logo_id": "IND",
    "logo_group": "flags48",
    "club_name": null,
    "person_pm": false,
    "horse_ids": [
      10016
    ],
    "person_no": "1955",
    "rlic": "",
    "fei_id": "10069973",
    "pm": "",
    "economy_pm": "",
    "ankomst": false,
    "epost": "",
    "company": "",
    "address_country": "",
    "orgnr": "",
    "iban": "",
    "bic": "",
    "bank": "",
    "holder": "",
    "bg_pg": "",
    "mobil": "",
    "telefon": "",
    "dagtele": "",
    "invoice_no": null,
    "invoice_closed": false
  }
]
```

Fields are added to this response over time, so the sample above is not
exhaustive.

### Update a person

```http
PATCH /meetings/{{meeting_id}}/people/{{person_id}} HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json
Content-Type: application/json

{
  "person": {
    "first_name": "Jon",
    "last_name": "Stenqvist",
    "custom_fields": {
      "url_to_photo": "https://placehold.co/400x400"
    }
  }
}
```

### Create a payment for person

```http
POST /meetings/{{meeting_id}}/people/{{person_id}}/economies/payments HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json
Content-Type: application/json

{
  "payment": {
    "account": "bank",
    "direction": "in",
    "amount": 340,
    "description": "Betalning",
    "created_at": "2024-03-08 14:40:00 +0100"
  }
}
```

`direction` is `in` for money you have received and `out` for money you have paid
out. It decides the sign of the stored amount, so send `amount` unsigned. A
payment that reaches Equipe without `direction` is stored as `out` — which is
what happens to the whole example above if you leave off the `payment` wrapper.


## Horses

A horse is identified by `hnr`, the number it has in the show.

Every field has a readable name and a stored column name, and the responses
carry both. `name` and `hast` are the same value, so are `category` and `k`.
Use the readable ones. The stored names are there because integrations were
written against them before the readable ones existed.

You can write with either name.

### List horses

Add `?q=` to search and `?page=` to get them 50 at a time. This one adds what
the horse is doing in the show, the competitions it starts in, its riders and
its payers. It uses the readable names apart from two: the licence is `hlic`
and the note is `pm`.

```http
GET /meetings/{{meeting_id}}/horses HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json
```

### Get a horse

```http
GET /meetings/{{meeting_id}}/horses/{{hnr}} HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json

{
  "hnr": 1,
  "num": 199,
  "name": "FIREFLY W",
  "category": "H",
  "born_year": "2010",
  "sex": "val",
  "breed": "Dutch Warmblood",
  "country": "NED",
  "owner": "Spruce Meadows Ltd.",
  "sire": "Nebab de Reve",
  "dam": "",
  "dam_sire": "Voltaire",
  "dams_dam": "",
  "dams_damsire": "",
  "fei_id": "105BI25",
  "licence": "",
  "licence_year": "",
  "reg_no": "",
  "height": "",
  "color": "",
  "race": "",
  "breeder": "",
  "section": null,
  "notes": "",
  "mark": "",
  "foreign_id": null,
  "vacc_checked": false,
  "ueln": "",
  "chip_no": "",
  "custom_fields": {}
}
```

The stored column names come with it in the same object: `hast`, `k`, `fo`,
`kon`, `agare`, `far`, `morfar`, `f_land`, `feipass` and the rest.

`vacc_checked` is not a column of its own. It says whether a vaccination date
has been set, and you can write it as `true` or `false` to set or clear that
date.

### Create a horse

`name` and `category` are required. Answers `201` with the horse.

```http
POST /meetings/{{meeting_id}}/horses HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json
Content-Type: application/json

{
  "horse": {
    "name": "FIREFLY W",
    "num": 199,
    "category": "H",
    "born_year": "2010",
    "sex": "val",
    "breed": "Dutch Warmblood",
    "country": "NED",
    "owner": "Spruce Meadows Ltd.",
    "sire": "Nebab de Reve",
    "fei_id": "105BI25"
  }
}
```

### Update a horse

Send only what you are changing. Answers `200` with the horse as it now
stands.

```http
PATCH /meetings/{{meeting_id}}/horses/{{hnr}} HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json
Content-Type: application/json

{
  "horse": {
    "owner": "New Owner",
    "vacc_checked": true
  }
}
```

### Delete a horse

Answers `204` with no body. A horse that still has starts cannot be deleted
and comes back as `422` instead.

```http
DELETE /meetings/{{meeting_id}}/horses/{{hnr}} HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json
```

### Errors

A horse the validations reject comes back as `422`, naming the field by its
readable name.

```json
{
  "errors": {
    "category": ["can't be blank"]
  }
}
```

A complaint about the horse as a whole, such as one that cannot be deleted,
is listed under `base`. People answer the same way.

## Batch API

Create or update multiple resources in one requests, and setup relationships based on external ids. [Read more](BATCH.md)
