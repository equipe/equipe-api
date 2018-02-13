---
title: Entries
position: 1.4
type: get
description: A representation of a shows entries for Equipe
right_code: |
  ~~~ json
  {
    "show": {
      "id": "fc1bf64e-1f6d-4838-ab45-1d4f0a079288",
      "name": "Mini show 2017",
      "currency": "SEK"
    },
    "competitions": [
      {
        "competition_no": "1",
        "name": "Two phases, not atc T A",
        "judgement_id": "274.5.1",
        "discipline": "H",
        "starts_on": "2017-01-10",
        "start_time": "12:00",
        "fence_height": 120,
        "entry_fee": 120,
        "late_entry_fee": 50,
        "vat": 0
      }
    ],
    "people": [
      {
        "id": "c0cdc695-c646-4b32-ab68-5fa92eca2fc5",
        "first_name": "Jon",
        "last_name": "Stenqvist",
        "person_no": "2010-10-12"
      }
    ],
    "horses": [
      {
        "id": "81ce6fc1-426b-4a77-9371-1605f51c9eef",
        "name": "Seed",
        "category": "H"
      }
    ],
    "entries": [
      {
        "id": "2f5e3700-95b6-47ea-a96c-99ea9cca6dbe",
        "competition_no": "1",
        "rider_id": "c0cdc695-c646-4b32-ab68-5fa92eca2fc5",
        "horse_id": "81ce6fc1-426b-4a77-9371-1605f51c9eef",
        "payer_id": "c0cdc695-c646-4b32-ab68-5fa92eca2fc5"
      }
    ]
  }
  ~~~
  {: title="Basic" }
  ~~~ http
  HTTP/1.1 202 Accepted
  ~~~
  {: title="Pending" }

  ~~~ http
  HTTP/1.1 401 Unauthorized
  ~~~
  {: title="Error" }
---
The `entries_url` is given by **Shows URL** response. Equipe will request the entries for the show the user have chosen to import.
{: .info }

Should return all entries for the show. All resources are represented in the top-level.

The response must validate json-schema [entries.json](https://app.equipe.com/api/schemas/entries.json)

Does it take long time to collect and build entries response? Return `202 ACCEPTED` until the data is ready and can be served. The *entries_url* will continue to be polled for 10 minutes or until it receive a non `202 ACCEPTED` status.

The entries import is designed so that it can be run any number of times before the show starts. First time the user have to select a show, after that when the import is requested by the user it will immediately start the import without prompting to select show again.

Values that have been changed by the user will not be overridden by changes from the entries given by the web service. Entries that are no longer present in the web service response will be withdrawn.

#### Models

* [Show](#modelsSHOW)
* [Competition](#modelsCOMPETITION)
* [Person](#modelsPERSON)
* [Horse](#modelsHORSE)
* [Club](#modelsCLUB)
* [Start](#modelsSTART)
