# Equipe Federation API

Welcome to Equipe Federation API docs. Looking for the possibility to integrate your federation to the world of Equipe? This will guide you how to structure your web service to be compliant with https://app.equipe.com to import entires, enable search of riders, officials, horses, clubs and later get results when the show is finished.

## Web services

  * Shows
  * Entries
  * Search riders
  * Search officials
  * Search horses
  * Search clubs
  * Upload entry file
  * Upload results

## Authentication

With each request the following headers will be set.

Header | Description
--- | :---
X-FEDERATION-API-KEY | The API-KEY for your web service that is known by our system
X-FEDERATION-ORGANIZER-ID | The organizer id
X-FEDERATION-USER-NAME | The name of the signed in user in our system that initiated the request

If the organizer does not have access to a specific end point, a 401 Unauthorized response should be returned.

## Shows

You only need to return current shows. The user will be able to choose a show to import from this list. This end point should only return shows for the organizer that is making the request, specified by the **X-FEDERATION-ORGANIZER-ID** request header.

Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
id | integer | Yes | Your primary key for the show
name | string | Yes | Name of the show
starts_on | string | No | ISO 8601 (YYYY-MM-DD) formatted start date
ends_on | string | No | ISO 8601 (YYYY-MM-DD) formatted end date
entries_url | url | Yes | Full url including protocol, host and path to the Entries end point for the given show

`GET https://example.com/shows.json`

```json
{
   "shows":[
      {
         "id":24,
         "name":"International CSI 3* Horse Show 2016",
         "starts_on":"2016-08-09",
         "ends_on":"2016-08-14",
         "entries_url":"https://example.com/shows/24/entries.json"
      },
      {
         "id":23,
         "name":"Jumping Championships (YR, J, C) 2016",
         "starts_on":"2016-07-28",
         "ends_on":"2016-07-30",
         "entries_url":"https://example.com/shows/23/entries.json"
      }
  ]
}
```

## Entries

Should return all entries for the show. All resources are represented in the top-level.

`GET https://example.com/shows/24/entries.json`

```json
{
  "show": {},
  "competitions": [],
  "people": [],
  "horses": [],
  "clubs": [],
  "entries": []
}
```

The entries import is designed so that it can be run any number of times before the show starts. First time the user have to select a show, after that when the import is requested by the user it will immediately start the import without prompting to select show again.

Values that have been changed by the user will not be overridden by changes from the entries given by the web service. Entries that are no longer present in the web service response will be withdrawn.

## Search riders

Lets users search and import individual riders to the show.

```json
{
  "riders": []
}
```

Search params

Param | Description
--- | :---
licence | National rider licence (exact match)
first_name | First name (starts with)
last_name | Last name (starts with)


Attribute | Type | Model | Mandatory | Description
--- | :---: | :---: | :---: | :---
riders | Array | Person | Yes | Matching riders

#### Example

`GET http://example.com/api/v1/search/riders.json?first_name=&last_name=stenqvist&licence=`

```json
{
  "riders":[
    {
      "id":12977,
      "licence":"51173",
      "licence_year":2009,
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
    },
    {
      "id":10502,
      "licence":"16995",
      "licence_year":2009,
      "first_name":"Anna",
      "last_name":"Stenqvist",
      "address":"xxx",
      "zipcode":"xxx",
      "city":"xxx",
      "address_country":"Sweden",
      "home_phone":"08-58358612",
      "club_id":1899,
      "club_logo_id":"0431",
      "club_logo_group": "svrf",
      "person_no":1958,
      "email":"xxx",
      "country":"SWE"
    }
  ]
}
```

## Search officials

Lets users search and import individual officials to the show.

```json
{
  "officials": []
}
```

Search params

Param | Description
--- | :---
first_name | First name (starts with)
last_name | Last name (starts with)


Attribute | Type | Model | Mandatory | Description
--- | :---: | :---: | :---: | :---
officials | Array | Person | Yes | Matching officials

## Search horses

Lets users search and import individual horses to the show.

```json
{
  "horses": []
}
```

Search params

Param | Description
--- | :---
licence | National horse licence (exact match)
name | Name (starts with)
breeder | Breeder (starts with)
owner | Owner (starts with)
born_year | Born year (exact match)


Attribute | Type | Model | Mandatory | Description
--- | :---: | :---: | :---: | :---
horses | Array | Horse | Yes | Matching horses

## Search clubs

Lets users search and import individual clubs to the show.

```json
{
  "clubs": []
}
```

Search params

Param | Description
--- | :---
name | Name (starts with)


Attribute | Type | Model | Mandatory | Description
--- | :---: | :---: | :---: | :---
clubs | Array | Club | Yes | Matching clubs

## Upload entry file

This is a useful option if your federation is not yet ready to commit to our standard format. You can build your own service that converts the entry file given by the entry system you are using.

* The user upload the entry file to Equipe
* Equipe will in the background make a post with the data untouched to `Entry file upload URL`, the Content-Type header is set as it was received by the user, the request.body contains the file content.
* You convert the entry file, and return our format for entries, see above ``Entries``
* Equipe import the information, and tracks changes. The user will be able to import the entries serveral times.

## Upload results

We support 3 different ways of exporting results.

* Submit the results directly to the federation in our format
* Submit the results to an external converter that transform our format to standard of the given federation, the file is downloaded and submitted manually to the federation by the user.
* Download results in our format directly from the system

### Submit results

#### Format

The result format has similar structure as the entries. But instead of entries, we export the starts. [See example](examples/results.json)

```json
{
  "show": {},
  "competitions": [],
  "people": [],
  "horses": [],
  "clubs": [],
  "teams": [],
  "starts": []
}
```

Provide the `Results URL` in the settings of the Federation in app.equipe.com.

When the user exports the results, our system will make an `HTTP POST` with content type of `application/json` the request body contains the results in json format. If you accept the file, return status `202 Accepted` to our system knows that the file is accepted.

In case of your own validation fails, the error needs to be communicated back to the user that tries to send the results.

Return `422 Unprocessable entity` with content type `422 Unprocessable entity` and the body should contain the error messages in json format as following

```json
{
 "errors": ["Missing licence of rider XXX"]
}
```

### Submit the results to external converter

Provide the `Result File URL` in the settings of the Federation in app.equipe.com

When the user initialize the export, our system will make an `HTTP POST` with content type of `application/json` the request body contain the results in json format. You transform the file and return in in the body with the correct content type set. We will then forward this to the user and the file will be downloaded automatically and the user can submit it to the federation.

In case of invalid result data return json response contain the error message with the status code `422 Unprocessable entity` as the example above.

### Download our result

This option is default if non of the above is specified. It will export the result data in our JSON-format to a file that will be downloaded.

# Models

## Show


Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
id | integer | Yes | Your primary key for the show
name | string | Yes | Name of the show
starts_on | string | No | ISO 8601 formatted start date
ends_on | string | No | ISO 8601 formatted end date
currency | string | No | ISO 4217 formmated currency code used for overall economy for the show
foreign_tax | boolean | No | If foreign tax should apply (When used automatic for people not from foreign_tax_skip)
foreign_tax_percent | decimal | No | Foreign tax percent
foreign_tax_skip | string | No | The IOC code, foreign tax but not for people from this country, this is the country code where the show is located.
income_tax | boolean | No | If income tax should apply (When used automatic for people from foreign_tax_skip-country without company)
income_tax_percent | float | No | Income tax percent
discount_club_id | integer | No | Primary key of the club that get discount
discount_club_percent | float | No | Discount percent for riders that competes from the same organizer that runs the show
penalty_fee | float | No | Penalty fee for starts marked with status `no-show`
credit_card_fee_percents | Array[float] | No | Possibllty to add credit card fee % on invoices
default_account | string | No | Defaults to `cash` <ul><li>prepaid</li><li>bank</li><li>cash</li><li>credit_card</li><li>swish</li></ul>
prize_money_equal_ranked | integer | No | Defaults to `2` <ul><li><strong>1</strong> Highest prize money</li><li><strong>2</strong> Prize money splits</li></ul>
result_name | string | No | Name of the person responsibly for the results to online.equipe.com
result_email | string | No | Email of the person responsibly for the results to online.equipe.com
result_cell_phone | string | No | Cell phone of the person responsibly for the results to online.equipe.com

## Competition

Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
name | string | Yes
competition_no | string | Yes | The number of the competition, needs to be unique within the show
discipline | string | Yes | D = Dressage, H = Show Jumping, F = Eventing, A = Breed evaluation, D = Driving, L = List, U = Exhibition, E = Endurance, R = Reining
status | string | No | K = Club, L = Local, R = Regional, N = National, E = Elite, I = International
starts_on | date | No | ISO 8601 formatted date
start_time | string | No | HH:MM
horse_pony | string | No | R = Horse, P = Pony
team | boolean | No
judgement_id | string | (Yes) | This is your federation id of judgement. In Equipe you configure the mapping between the judgement in Equipe with your judgement id. This number needs to be uniq within each discipline.
fence_height | integer | (Yes) | If show jumping, height in cm
arena | string | No | Name of the arena
entry_fee | decimal |
starting_fee | decimal |
late_entry_fee | decimal |
prize_money | Array[decimal] | No | Prize money split
prize_money_currency | string | No | ISO 4217 formatted currency for prize money
young_horse_entry_fee | decimal | No |  Young horses entry fee
young_horse_starting_fee | decimal | No |  Young horses Starting fee
young_horse_late_entry | decimal | No |  Young horses late entry
young_horse_prize_money | Array[decimal] | No | Young horses prize money split
admin_fee | decimal | No | Admin fee
team | boolean | No | Team competition
team_entry_fee | decimal | No | Team entry fee
team_prize_money | Array[decimal] | No | Prize money split team
open_for_young_horses | boolean | No | Open for young horses
honorary_award | boolean | No | Prize in kind
randomized | boolean | No | Competition is randomized
category_merge | string | No | Value of <ul><li>category_by_category</li><li>all_categories_together</li><li>three_full_category</li></ul>
club_discount_percent_applied | boolean | No | Apply discount for riders that competes for the same organizer that runs the show

## Person

Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
id | integer | Yes |When importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute.
first_name | string | Yes
last_name | string | Yes
address | string | No
zipcode | string | No
city | string | No
address_country | string | No | Full name of the country used for the address
country | string | Yes | The IOC code for the country for which the rider competes
work_phone | string | No
home_phone | string | No
cell_phone | string | No
fax | string | No
email | string | No
licence | string | No | National licence
licence_year | integer | No | Year the licence is valid for
club_id | integer | Yes
fei_id | string | No | FEI ID for the person
person_no | string | No | Either ISO 8601 formatted birth date, or only year of birth
company | string | No | If the person is represented by a company, this name will be included on the invoice
vat_no | string | No | VAT number for the company
foreign_tax | boolean | No | Apply foreign tax leave as null to make the system auto calculate this
account_number | string | No
account_holder | string | No
bank_name | string | No
iban | string | No
bic | string | No
invoice_no | integer | No | Invoice number generated by the system on print out
official | boolean | No | Flag this person as an official
arrived | boolean | No
notes | text | No
payments | Object | No | Object that contains prepayments. Key is the account name, it will update or create the first payment with this account name. See example.

#### Example

```json
{
  "id": 9622,
  "first_name": "Jon",
  "last_name": "Stenqvist",
  "address": "Sundstorget 3",
  "city": "Helsingborg",
  "zipcode": "252 21",
  "address_country": "Sweden",
  "country": "SWE",
  "email": "jon.stenqvist@equipe.com",
  "company": "Equipe AB",
  "notes": "Please stable with Hampus Nordin's horses",
  "payments": {
      "prepaid": {
          "amount": 250,
          "description": "Notes",
          "created_at": "2017-05-06"
      }
  }  
},
```

## Horse

Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
id | integer | Yes |When importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute.
name | string | No
born_year | string | No | 4-digits birth year
sex | string | Yes | Valid values are S = Stallion, G = Gelding, M = Mare, unknown = Unknown. Defaults to unknown
category | string | No | H = Horse, A, B, C, D, 1, 2 or 3. Defaults to H
licence | string | No | National licence
fei_id | string | No | FEI ID
country | string | No | The IOC code for the country in which the horse was born
color | string | No | Color of the horse
breed | string | No | Stud book of the horse in short, e.g. SWB or HANN
race | string | No | Race of the horse
height | string | No | Height of the horse
reg_no | string | No | Registration number of the horse
breeder | string | No
owner | string | No
sire | string | No
dam | string | No
dams_dam | string | No
dam_sire | string | No
dams_damsire | string | No
notes | text | No

#### Example

```json
{
  "id": 96571,
  "name": "Lady Amaretto",
  "reg_no": "3214443243333",
  "owner": "Cathy Cuffe",
  "height": "165",
  "color": "Bay",
  "sire": "Captain Clover",
  "dam": "",
  "dam_sire": "Cavalier Royale",
  "born_year": 2008,
  "sex": "M",
  "category": "H"
}
```

## Club

Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
id | integer | Yes |When importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute.
name | string | Yes
short | string | No
logo_id | string | Yes | Refers to our central repository for logos which are shared between all our systems
logo_group | string | Yes

See separate documentation about logo_id and logo_group.

#### Example

```json
{
  "id": 10001,
  "name": "Helsingborgs Fältrittklubb",
  "short": "HFRK",
  "logo_id": "0235",
  "logo_group": "svrf"
}
```

## Start

Attribute | Type | Mandatory | Description
--- | :---: | :---: | ---
id | integer | Yes |When importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute.
competition_no | string | Yes | Refers to Competition competition_no
rider_id | integer | Yes | Primary key of the rider
horse_id | integer | No | Primary key of the horse
payer_id | integer | No | Primary key of the payer defaults to rider
category | string | No | H = Horse, A, B, C, D, 1, 2 or 3. Defaults to H
section | string | No | A or B, defaults to A
status | string | No | Can be empty, withdrawn, unpaid, no_show, changed, reserve or starting
late_entry | boolean | No | If true, the late entry fee will be applied
outside_comp | boolean | No |If true, this start will not be ranked
