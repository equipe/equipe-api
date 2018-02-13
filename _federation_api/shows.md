---
title: Shows
position: 1.3
type: get
description: List shows that is available for import
right_code: |
  ~~~ json
  {
     "shows":[
        {
           "id":"f34a80c1-069f-4498-846a-e3fca05a7f00",
           "name":"International CSI 3* Horse Show 2016",
           "starts_on":"2016-08-09",
           "ends_on":"2016-08-14",
           "entries_url":"https://example.com/shows/24/entries.json"
        },
        {
           "id":"9305e1ed-8d8a-4242-ad12-08e1ea4cf046",
           "name":"Jumping Championships (YR, J, C) 2016",
           "starts_on":"2016-07-28",
           "ends_on":"2016-07-30",
           "entries_url":"https://example.com/shows/23/entries.json"
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
Make sure that you have specified **Shows URL** under settings for your federation in app.equipe.com.
{: .info }

You only need to return current shows. The user will be able to choose a show to import from this list. This url should only return shows for the organizer that is making the request, specified by the **X-FEDERATION-ORGANIZER-ID** request header.

The response must validate json-schema [shows.json](https://app.equipe.com/api/schemas/shows.json)

Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
id | string | Yes | Your primary key for the show
name | string | Yes | Name of the show
starts_on | string | No | ISO 8601 (YYYY-MM-DD) formatted start date
ends_on | string | No | ISO 8601 (YYYY-MM-DD) formatted end date
entries_url | url | Yes | Full url including protocol, host and path to the Entries end point for the given show

Test this by creating a new show in Equipe, once the show is created go to File > Your federation > Import entries
{: .success }
