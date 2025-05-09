# Equipe Rest API

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

### Create a payment for person

```http
POST /meetings/{{meeting_id}}/people/{{person_id}}/economies/payments HTTP/1.1
X-Api-Key: {{api_key}}
Accept: application/json
Content-Type: application/json

{
  "account": "bank",
  "direction": "in",
  "amount": 340,
  "description": "Betalning",
  "created_at": "2024-03-08 14:40:00 +0100"
}
```

## Batch API

Create or update multiple resources in one requests, and setup relationships based on external ids. [Read more](BATCH.md)


