# Equipe Rest API

## Request bodies

The endpoints below take the attributes of a write request wrapped in the name
of the resource — `{"person": {...}}`, `{"payment": {...}}` — sent as
`Content-Type: application/json`.

Without the wrapper the request still succeeds, but Equipe adds the wrapper for
you and keeps only the fields it already knows about; anything else is dropped
before it reaches the endpoint, with no error. A misspelled field name is
answered with `200 OK` and simply has no effect. Wrap the body yourself and
Equipe rejects what it does not understand instead of ignoring it.

## People

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


## Batch API

Create or update multiple resources in one requests, and setup relationships based on external ids. [Read more](BATCH.md)
