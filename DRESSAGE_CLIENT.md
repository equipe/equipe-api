# Custom dressage client

> Use this only if you have very specific use case, as you will loose synchronisation.

## Introduction

* Find out your organizer_id, show_id and competition_id by looking at the url, or browsing the api end points.
* GET starts.json
* GET people.json and horses.json if you need FEI IDs, don't this initial one time before the competition starts
* PATCH points.json to submit provisional points per judge
* PATCH updates.json to submit results per judge

## Authentication

Login to your account. Visit you profile page and click show API-Key. This key should be set in the X-API-KEY header on every request.

## Shows

`GET /organizers/:organizer_id/meetings.json`

###### Example JSON request

```json
[
  {
    "id": 1961,
    "name": "Dressage International Horse Show",
    "starts_on": "2016-08-08",
    "ends_on": "2016-08-14",
    "logo_id": "10000",
    "logo_group": "svrf"
  }
]
```

## Competitions

`GET /meetings/:show_id/competitions.json`

```json
[
  {
    "kq": 1,
    "klass": "CDI5* GPS - Grand Prix Special (GPS)"
  }
]
```

Attribute | Type | Description
--- | --- | ---
kq | integer | ID
klass | string | Name of the competition


## People

`GET /meetings/:show_id/people.json`

Attribute | Type | Description
--- | --- | ---
rnr | integer | ID
internet_rnr | integer | Foreign id
fei_id | string | FEI ID
rlic | string | License
name | text | Name
country | string | Nation
person_no | string | Birthday


###### Response

`200 OK`


###### Example JSON Response

```json
[
  {
    "rnr": 11059,
    "internet_rnr": 1008621,
    "rlic": "",
    "fei_id": "",
    "name": "Jon Stenqvist",
    "country": "SWE",
    "person_no": "2016-11-01"
  }
]
```

## Horses

`GET /meetings/:show_id/people.json`

Attribute | Type | Description
--- | --- | ---
hnr | integer | Id
num | integer | H.No
name | string | Name
born_year | string | Born
sex | string | Sex
category | string | C
hlic | string | License
fei_id | string | FEI ID
country | string | Country
color | string | Color
race | string | Race
breed | string | Studbook
height | string | Height
reg_no | string | Reg no
breeder | string | Breeder
owner | string | Owner
sire | string | Sire
dam | string | Dam
dams_dam | string | Granddam
dam_sire | string | Damsire
dams_damsire | string | Granddam's sire
section | string | Section
pm | text | PM

## Starts

Return start lists for the given competition

`GET /meetings/:show_id/competitions/:competition_id/starts.json`

## Results

`GET /meetings/:show_id/competitions/:competition_id/H/results.json`

###### Example JSON Response

```json
[
  {
    "id": 10079,
    "kq": 3,
    "rnr": 10068,
    "bnr": 10058,
    "re": 1,
    "result_preview": "67.674",
    "ct": 213,
    "ck": 78,
    "oct": 2,
    "ock": 1,
    "pc": 291,
    "oc": 1,
    "ctp": 66.563,
    "ckp": 70.909,
    "csp": 67.674,
    "ptxt_c": "7;7.5;8;7;7;7;6.5;7;7.5;6.5;7;6;6.5;6.5;7;7;7;7;6.5;6.5;7;4.5;7;6.5;6;7;7;6.5;7;8",
    "fr_c": 0
  }
]
```

## Submit provisional points

This should be push on every update.

`PATCH /meetings/:show_id/competitions/:competition_id/H/results/points.json`

###### Example JSON Body

*10079 needs to be replaced with the id for the start that you are updating*

```json
{
    "starts":{
        "10079":{
            "C":{
                "1":7.5,
                "2":8,
                "3":7
            }
        }
    }
}
```

###### Response

`200 OK`

###### Example JSON Response

Returns what have been updated, should be equal to the inner structure for your points hash.

```json
{
  "C": {
    "1": 7.5,
    "2": 8,
    "3": 7
  }
}
```


## Submit results

`PATCH /meetings/1832/competitions/3/H/results/updates.json`

All judge by columns repeats for every valid position.

* K
* E
* H
* C
* M
* B
* F

Attribute | Type | Description
--- | --- | ---
ptxt_**c** | string | Judge By C points
fr_**c** | float | Judge By C deduction
**c**t | float | Judge By C Technical
**c**tp | float | Judge By C Technical %
**c**k | float | Judge By C Artistic
**c**kp | float | Judge By C Artistic %
p**c** | float | Judge By C Total Score
**c**sp | float | Judge By C %
or | string | Reason <ul><li><strong>U</strong> = Retired</li><li><strong>D</strong> = Eliminated</li><li><strong>S</strong> = Disqualified</li></ul> *The rider count as started*
a | string | Status <ul><li><strong>Ö</strong> = Withdrawn</li><li><strong>U</strong> = No-show</li></ul> *Rider count as not started*


###### Example JSON Body

*10079 needs to be replaced with the id for the start that you are updating*

```json
{
    "starts": {
        "10079": {
            "ptxt_c": "7;7.5;7;7;7;7;6.5;7;7.5;6.5;7;6;6.5;6.5;7;7;7;7;6.5;6.5;7;4.5;7;6.5;6;7;7;6.5;7;8;",
            "fr_c": "0",
            "ct": "213",
            "ctp": "66.5625",
            "ck": "78",
            "ckp": "70.9090909090909",
            "pc": "291",
            "csp": "67.67441860465117",
            "or": "",
            "a": ""
        }
    }
}
```

###### Response

`200 OK`




