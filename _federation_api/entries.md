---
title: Entries
position: 1.4
type: get
description: A representation of a shows entries for Equipe
right_code: |
  ~~~ json
  {
    "show": {
      "id": 1,
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
        "id": 1,
        "first_name": "Jon",
        "last_name": "Stenqvist",
        "person_no": "2010-10-12"
      }
    ],
    "horses": [
      {
        "id": 1,
        "name": "Seed",
        "category": "H"
      }
    ],
    "entries": [
      {
        "id": 1,
        "competition_no": "1",
        "rider_id": 1,
        "horse_id": 1,
        "payer_id": 1
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
