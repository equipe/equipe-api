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
        "id": "0bcbfcd3-27ed-455b-a9e5-05dd34bfc8dc",
        "horse_no": 514,
        "name": "Seed",
        "category": "H",
        "licence": "284808",
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

licence
: Licence of the horse

name
: Name of the horse starts with

born_year
: The year the horse was born

owner
: Name of the owner

breeder
: Name of the breeder

rider_licence
: Licence of a rider, when the user looks for the horses of a rider

rider_fei_id
: FEI id of the rider, when the user looks for the horses of a rider

rider_foreign_id
: Your id of the rider, when the user looks for the horses of a rider

Equipe only looks for the horses of a rider when **Support search horses via rider** is turned on in the settings for your federation.

The response must validate json-schema [horses.json](https://app.equipe.com/api/schemas/horses.json)

#### In Equipe

This is how Equipe shows your answer, here for a search on the name "seed". The user picks a horse with **Choose**.

<a href="images/search_horses.png"><img src="images/search_horses.png" alt="The horses found in a search on the federation's tab in Equipe" style="width: 100%"/></a>

#### Models

* [Horse](#modelsHORSE)
