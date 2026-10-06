---
title: Search officials
position: 1.6
type: get
description: Allows search and import individual officials to the show
right_code: |
  ~~~ json
  {
    "officials": [
      {
        "id": "3db1f0f6-957b-4269-8431-ced00cd93180",
        "first_name": "Jon",
        "last_name": "Stenqvist",
        "official": true
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
Make sure that you have specified **Search officials URL** under settings for your federation in app.equipe.com.
{: .info }

licence
: Licence of the official

first_name
: First name starts with

last_name
: Last name starts with

The response must validate json-schema [officials.json](https://app.equipe.com/api/schemas/officials.json)

#### In Equipe

This is how Equipe shows your answer, here for a search on the last name "sten". The user picks an official with **Choose**.

<a href="images/search_officials.png"><img src="images/search_officials.png" alt="The officials found in a search on the federation's tab in Equipe" style="width: 100%"/></a>

#### Models

* [Official](#modelsOFFICIAL)
