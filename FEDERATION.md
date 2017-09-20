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

The response must validate json-schema [shows.json](https://app.equipe.com/api/schemas/shows.json)

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

The response must validate json-schema [entries.json](https://app.equipe.com/api/schemas/entries.json)

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

The response must validate json-schema [riders.json](https://app.equipe.com/api/schemas/riders.json)

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

The response must validate json-schema [officials.json](https://app.equipe.com/api/schemas/officials.json)

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

The response must validate json-schema [horses.json](https://app.equipe.com/api/schemas/horses.json)

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

The response must validate json-schema [clubs.json](https://app.equipe.com/api/schemas/clubs.json)

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

Return `422 Unprocessable entity` with content type `application/json` and the body should contain the error messages in json format as following

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

* [Show](models/SHOW.md)
* [Competition](models/COMPETITION.md)
* [Person](models/PERSON.md)
* [Horse](models/HORSE.md)
* [Club](models/CLUB.md)
* [Start](models/START.md)
* [Rider (only for search riders)](models/RIDER.md)
* [Official (only for search officials)](models/RIDER.md)
