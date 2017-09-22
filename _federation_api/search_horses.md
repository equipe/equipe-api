---
title: Search horses
position: 1.7
type: get
description: Allows search and import individual horses to the show
right_code: |
  ~~~ json
  {
    "horses": [
      {
        "id": 10072,
        "horse_no": 514,
        "name": "Seed",
        "category": "H",
        "license": "284808",
        "licence_year": "2017",
        "country": "GER",
        "fei_id": "104HT47",
        "born_year": "2006",
        "color": "Dar Bay",
        "sex": "G",
        "sire": "Stolzenberg",
        "dam": "Gera",
        "dam_sire": "Glueckspilz",
        "breeder": "Helmut Haberman",
        "owner": "Jon Stenqvist",
        "reg_no": "DE431311320706",
        "chip_no": "752098100464709"
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
Make sure that you have specified **Search horses URL** under settings for your federation in app.equipe.com.
{: .info }

first_name
: First name starts with

last_name
: Last name starts with

The response must validate json-schema [horses.json](https://app.equipe.com/api/schemas/horses.json)

#### Models

* [Horse](#modelsHORSE)
