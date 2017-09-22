---
title: Search riders
position: 1.5
type: get
description: Allows search and import individual riders to the show
right_code: |
  ~~~ json
  {
    "riders":[
      {
        "id":12977,
        "licence":"51173",
        "licence_year":2017,
        "first_name":"Jon",
        "last_name":"Stenqvist",
        "address":"xxx",
        "zipcode":"xxx",
        "city":"xxx",
        "address_country":"Sweden",
        "home_phone":"",
        "club_id":2628,
        "club_logo_id":"0235",
        "club_logo_group": "svrf",
        "person_no":1969,
        "email":"xxx",
        "country":"SWE"
      }
    ]
  }
  ~~~
  {: title="Response" }

  ~~~ http
  HTTP/1.1 401 Unauthorized
  ~~~
  {: title="Error" }
---
Make sure that you have specified **Search riders URL** under settings for your federation in app.equipe.com.
{: .info }


licence
: National rider licence (exact match)

first_name
: First name (starts with)

last_name
: Last name (starts with)

The response must validate json-schema [riders.json](https://app.equipe.com/api/schemas/riders.json)

#### Models

* [Rider](#modelsRIDER)
