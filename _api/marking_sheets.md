---
title: Marking Sheets
description: List all marking sheets
type: get
position: 4
right_code: |
  ~~~ json
  [
    {
      "id": 307,
      "federation": "FEI",
      "name": "FEI Grand Prix 16-25",
      "sp": "E",
      "year": "2009",
      "course_length": "60",
      "time": "6",
      "type": "D",
      "max_score": 430,
      "format": {
        "pdf": "https://app.equipe.com/federations/4/marking_sheets/307.pdf",
        "xml": "https://app.equipe.com/federations/4/marking_sheets/307.xml",
        "json": "https://app.equipe.com/federations/4/marking_sheets/307.json"
      }
    },
    {
      "id": 306,
      "federation": "FEI",
      "name": "FEI Ind. Comp. Test Regional Games",
      "sp": "E",
      "year": "1997",
      "course_length": "60",
      "time": "6,5",
      "type": "D",
      "max_score": 370,
      "format": {
        "pdf": "https://app.equipe.com/federations/4/marking_sheets/306.pdf",
        "xml": "https://app.equipe.com/federations/4/marking_sheets/306.xml",
        "json": "https://app.equipe.com/federations/4/marking_sheets/306.json"
      }
    }
  ]
  ~~~
  {: title="Response" }
---

Marking Sheets are used for Dressage, Freestyle, Para-dressage, Eventing and more. These sheets are created within app, and mapped to your specified judgement id or rule code.

As you will put a lot of effort creating this sheets we want to make sure that you are able to re-use this information outside app.equipe.com.
{: .success }

This will return all marking sheets, both the FEI and those created specific for your own federation.

~~~ bash
curl /federations/YOUR_FEDERATION_ID/marking_sheets.json?api_key=YOUR_APP_KEY
~~~
{: title="Curl" }

Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
federation | string | Yes
name | string | Yes
sp | string | Yes | Language
year | string | Yes | Edition
course_length | string | Yes
time | string | Yes
type | string | Yes
max_score | integer | Yes
format | url | object | Marking sheet in the different formats

Follow the links to get the marking sheet in pdf or as json with full details.
