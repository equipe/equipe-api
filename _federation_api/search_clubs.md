---
title: Search clubs
position: 1.8
type: get
description: Allows search and import individual clubs to the show
right_code: |
  ~~~ json
  {
    "clubs": [
      {
        "id":235,
        "name":"Helsingborgs FRK",
        "logo_id":"0235",
        "logo_group":"svrf"
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
Make sure that you have specified **Search clubs URL** under settings for your federation in app.equipe.com.
{: .info }

name
: Name starts with

The response must validate json-schema [clubs.json](https://app.equipe.com/api/schemas/clubs.json)

#### Models

* [Club](#modelsCLUB)
