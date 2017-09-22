---
title: Search officials
position: 1.6
type: get
description: Allows search and import individual officials to the show
right_code: |
  ~~~ json
  {
    "officials": [
      "id": 1234,
      "first_name": "Jon",
      "last_name": "Stenqvist",
      "official": true
    ]
  }
  ~~~
  {: title="Response" }

  ~~~ http
  HTTP/1.1 401 Unauthorized
  ~~~
  {: title="Error" }
---
Make sure that you have specified **Search officials URL** under settings for your federation in app.equipe.com.
{: .info }

first_name
: First name starts with

last_name
: Last name starts with

The response must validate json-schema [officials.json](https://app.equipe.com/api/schemas/officials.json)

#### Models

* [Official](#modelsOFFICIAL)
