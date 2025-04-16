# Start and result lists

> [!NOTE]
> See a script that uses this documentation to fetch competitions and start lists, and to send results.

You can pull and push start and result lists from Equipe.

**Prerequisites**

1. Ensure that your user is added to the relevant organizer that is running the show in Equipe.
2. Retrieve your API key by signing in to [app.equipe.com](https://app.equipe.com). Click your name, then click the **Show** button next to the **API key** field.
3. Save the `meeting_id` (also called the `show_id`) of the target show in Equipe that you want to interact with.

> [!TIP]
> In most Equipe paths, you can append `.json` to the URL to see the underlying data.

## Competitions

```http
GET /meetings/:meeting_id/competitions.json  HTTP/1.1
X-Api-Key: {{api_key}}
```

```json
[
  {
    "kq": 27,
    "clabb": "27",
    "klass": "CSI5* Grand Prix Table A (238.2.2a-GP) 1.60m"
  }
]
```

Attribute | Type | Description
--- | --- | ---
kq | integer | ID
clabb | string | Competition number
klass | string | Name of the competition


### Pulling (Retrieving) a Start List

```http
GET meetings/:meeting_id/competitions/:kq/starts.json  HTTP/1.1
X-Api-Key: {{api_key}}
```

It's possible to add extra columns (for example, the FEI ID of the rider and horse) by using `columns[]` parameters.

`/meetings/:meeting_id/competitions/:q/starts.json?columns[]=rider_fei_id&columns[]=horse_fei_id`

```json
[
  {
    "rider_name": "Jon Stenqvist",
    "rider_name_order": "StenqvistJon",
    "rider_first_name": "Jon",
    "rider_last_name": "Stenqvist",
    "rider_short_name": "J. Stenqvist",
    "horse_name": "Natina du Soufflet",
    "horse_no": 4,
    "club_name": null,
    "logo_id": "SWE",
    "logo_group": "flags48",
    "clabb_no": "1",
    "start_custom_fields": {},
    "rider_custom_fields": {},
    "horse_custom_fields": {},
    "id": 5,
    "kq": 1,
    "ord": 1000,
    "vord": null,
    "st": 1,
    "tid": "",
    "tidd": null,
    "rnr": 1,
    "bnr": 1,
    "efteranm": false,
    "k": "H",
    "av": "A",
    "re": 999,
    "paus": null,
    "pause_name": "",
    "knr": null,
    "hnr": 4,
    "a": "",
    "lag_id": null,
    "utt": false,
    "koeff": false,
    "team_coefficient": null,
    "utl": false,
    "ord_omh": null,
    "notes": false,
    "notes_todo": false,
    "notes_pending": false,
    "premie": 0,
    "result_at": null
  },
  {
    "rider_name": "Kim Fors",
    "rider_name_order": "ForsKim",
    "rider_first_name": "Kim",
    "rider_last_name": "Fors",
    "rider_short_name": "K. Fors",
    "horse_name": "Baligari",
    "horse_no": 2,
    "club_name": null,
    "logo_id": "SWE",
    "logo_group": "flags48",
    "clabb_no": "1",
    "start_custom_fields": {},
    "rider_custom_fields": {},
    "horse_custom_fields": {},
    "id": 3,
    "kq": 1,
    "ord": 1001,
    "vord": null,
    "st": 2,
    "tid": "",
    "tidd": null,
    "rnr": 4,
    "bnr": 4,
    "efteranm": false,
    "k": "H",
    "av": "A",
    "re": 999,
    "paus": null,
    "pause_name": "",
    "knr": null,
    "hnr": 2,
    "a": "",
    "lag_id": null,
    "utt": false,
    "koeff": false,
    "team_coefficient": null,
    "utl": false,
    "ord_omh": null,
    "notes": false,
    "notes_todo": false,
    "notes_pending": false,
    "premie": 0,
    "result_at": null
  },
  {
    "rider_name": "Nick van Sante",
    "rider_name_order": "van SanteNick",
    "rider_first_name": "Nick",
    "rider_last_name": "van Sante",
    "rider_short_name": "N. van Sante",
    "horse_name": "Franco's Feelina",
    "horse_no": 5,
    "club_name": null,
    "logo_id": "NED",
    "logo_group": "flags48",
    "clabb_no": "1",
    "start_custom_fields": {},
    "rider_custom_fields": {},
    "horse_custom_fields": {},
    "id": 1,
    "kq": 1,
    "ord": 1002,
    "vord": null,
    "st": 3,
    "tid": "",
    "tidd": null,
    "rnr": 2,
    "bnr": 2,
    "efteranm": false,
    "k": "H",
    "av": "A",
    "re": 999,
    "paus": null,
    "pause_name": "",
    "knr": null,
    "hnr": 5,
    "a": "",
    "lag_id": null,
    "utt": false,
    "koeff": false,
    "team_coefficient": null,
    "utl": false,
    "ord_omh": null,
    "notes": false,
    "notes_todo": false,
    "notes_pending": false,
    "premie": 0,
    "result_at": null
  },
  {
    "rider_name": "Jens Feth",
    "rider_name_order": "FethJens",
    "rider_first_name": "Jens",
    "rider_last_name": "Feth",
    "rider_short_name": "J. Feth",
    "horse_name": "Aranykapu Sancasall",
    "horse_no": 1,
    "club_name": null,
    "logo_id": "GER",
    "logo_group": "flags48",
    "clabb_no": "1",
    "start_custom_fields": {},
    "rider_custom_fields": {},
    "horse_custom_fields": {},
    "id": 2,
    "kq": 1,
    "ord": 1003,
    "vord": null,
    "st": 4,
    "tid": "",
    "tidd": null,
    "rnr": 5,
    "bnr": 5,
    "efteranm": false,
    "k": "H",
    "av": "A",
    "re": 999,
    "paus": null,
    "pause_name": "",
    "knr": null,
    "hnr": 1,
    "a": "",
    "lag_id": null,
    "utt": false,
    "koeff": false,
    "team_coefficient": null,
    "utl": false,
    "ord_omh": null,
    "notes": false,
    "notes_todo": false,
    "notes_pending": false,
    "premie": 0,
    "result_at": null
  },
  {
    "rider_name": "Thom Kerssies",
    "rider_name_order": "KerssiesThom",
    "rider_first_name": "Thom",
    "rider_last_name": "Kerssies",
    "rider_short_name": "T. Kerssies",
    "horse_name": "Crazy Anke",
    "horse_no": 3,
    "club_name": null,
    "logo_id": "NED",
    "logo_group": "flags48",
    "clabb_no": "1",
    "start_custom_fields": {},
    "rider_custom_fields": {},
    "horse_custom_fields": {},
    "id": 4,
    "kq": 1,
    "ord": 1004,
    "vord": null,
    "st": 5,
    "tid": "",
    "tidd": null,
    "rnr": 3,
    "bnr": 3,
    "efteranm": false,
    "k": "H",
    "av": "A",
    "re": 999,
    "paus": null,
    "pause_name": "",
    "knr": null,
    "hnr": 3,
    "a": "",
    "lag_id": null,
    "utt": false,
    "koeff": false,
    "team_coefficient": null,
    "utl": false,
    "ord_omh": null,
    "notes": false,
    "notes_todo": false,
    "notes_pending": false,
    "premie": 0,
    "result_at": null
  }
]```

Attribute | Type | Description
--- | --- | ---
id | integer | ID
kq | integer | Competition ID
ord | integer | Start order
tid | string | Start time
st | integer | Start number
rnr | integer | Rider ID
rider_name | string | Full name of the rider
rider_name_order | string | Rider name in "LastFirst" format
rider_first_name | string | First name of the rider
rider_last_name | string | Last name of the rider
rider_short_name | string | Abbreviated name of the rider
bnr | integer | Payer ID (Account ID)
horse_name | string | Full name of the horse
horse_no | integer | Horse number / BiB / Head number
club_name | string | Name of the rider's club
logo_id | string | Logo identifier
logo_group | string | Logo group (e.g., federation)
efteranm | boolean | Indicates late entry
k | string | Horse category (e.g. H)
av | string | Division (e.g., "A")
re | integer | Result value (e.g., 999 = not ranked)
paus | string or null | Indicates if a pause occurs, (e.g 10 it's 10 min pause, 10:00 means break until 10:00)
pause_name | string | Name or description of the pause
knr | integer | Club ID
hnr | integer | Horse ID
a | string | Status of the Start, S = Starting, all other are different version of Withdrawn
lag_id | integer or null | Team ID if part of a team
utt | boolean | Hors Concours
utl | boolean | In case of a Teem member and Must Count
ord_omh | integer or null | Order in jump-off OR overriden start order from result registraion

### Push result list

Utilizing the [Batch API](http://api-docs.equipe.com/#federation_apisingle_sign_on), to update the start list in Equipe could look like this.

This is an advanced tool that offers full control when updating the result list.

```http
POST /meetings/{{meeting_id}}/batch HTTP/1.1
X-Api-Key: {{api_key}}
X-Transaction-Uuid: {{your-newly-generated-uuid-to-group-all-operations}}
Accept: application/json
Content-Type: application/json

{
  "competitions": {
    "unique_by": "kq",
    "records": [
      {
        "kq": 1,
        "grundt": 78,
        "omh1t": 63
      }
    ]
  },
  "starts": {
    "unique_by": "id",
    "where": {
      "competition": {
        "kq": 1
      }
    },
    "replace": true,
    "records": [
      {
        "ord": 1000,
        "st": 1,
        "rnr": 1,
        "hnr": 4,
        "bnr": 1,
        "k": "H",
        "av": "A",
        "grundf": 0,
        "grundt": 66.14,
        "tfg": 0,
        "omh1f": 0,
        "omh1t": 55.3,
        "tf1": 0,
        "totfel": 0,
        "re": 1,
        "rid": true,
        "result_at": "2025-04-16T13:03:43",
        "last_result_at": "2025-04-16T13:03:43",
        "premie": 0,
        "premie_show": 0,
        "rtxt": null,
        "or": "",
        "a": ""
      },
      {
        "ord": 1004,
        "st": 5,
        "rnr": 3,
        "hnr": 3,
        "bnr": 3,
        "k": "H",
        "av": "A",
        "grundf": 3,
        "grundt": 80.7,
        "tfg": 3,
        "omh1f": 0,
        "omh1t": 47.21,
        "tf1": 0,
        "totfel": 3,
        "re": 2,
        "rid": true,
        "result_at": "2025-04-16T13:03:45",
        "last_result_at": "2025-04-16T13:03:45",
        "premie": 0,
        "premie_show": 0,
        "rtxt": null,
        "or": "",
        "a": ""
      },
      {
        "ord": 1003,
        "st": 4,
        "rnr": 5,
        "hnr": 1,
        "bnr": 5,
        "k": "H",
        "av": "A",
        "grundf": 0,
        "grundt": 76.68,
        "tfg": 0,
        "omh1f": 9,
        "omh1t": 63.87,
        "tf1": 1,
        "totfel": 9,
        "re": 3,
        "rid": true,
        "result_at": "2025-04-16T13:03:45",
        "last_result_at": "2025-04-16T13:03:45",
        "premie": 0,
        "premie_show": 0,
        "rtxt": null,
        "or": "",
        "a": ""
      },
      {
        "ord": 1001,
        "st": 2,
        "rnr": 4,
        "hnr": 2,
        "bnr": 4,
        "k": "H",
        "av": "A",
        "grundf": 999,
        "grundt": null,
        "tfg": null,
        "omh1f": null,
        "omh1t": null,
        "tf1": null,
        "totfel": 999,
        "re": 4,
        "rid": true,
        "result_at": "2025-04-16T13:03:44",
        "last_result_at": "2025-04-16T13:33:57.085103",
        "premie": 0,
        "premie_show": 0,
        "rtxt": null,
        "or": "D",
        "a": ""
      },
      {
        "ord": 1002,
        "st": 3,
        "rnr": 2,
        "hnr": 5,
        "bnr": 2,
        "k": "H",
        "av": "A",
        "grundf": null,
        "grundt": null,
        "tfg": null,
        "omh1f": null,
        "omh1t": null,
        "tf1": null,
        "totfel": null,
        "re": 999,
        "rid": false,
        "result_at": null,
        "last_result_at": null,
        "premie": 0,
        "premie_show": 0,
        "rtxt": null,
        "or": "",
        "a": "Ö"
      }
    ]
  }
}
```

### Competition

Attribute | Type | Description
--- | --- | ---
grundt | float | Round 1 Time allowed
omh1t | float | Round 2 Time allowed
omh2t | float | Round 3 Time allowed
omg3t | float | Round 4 Time allowed
omg4t | float | Round 5 Time allowed
omg5t | float | Round 6 Time allowed
koe | integer | Number of starts goes to next round


### Start

Attribute | Type | Description
--- | --- | ---
premie | float | Prize money in the currency of that the show are using
premie_show | float | Prize money in origin currency of the competition, normalize same as above, must be set
rtxt | string | Prize in kind, e.g. Car, Tractor etc
grundf | float | Round 1 Faults
grundt | float | Round 1 Time
tfg | float | Round 1 Time Faults
round1_in_team | float | Round 1 calculated in Team result
omh1f | float | Round 2 Faults
omh1t | float | Round 2 Time
tf1 | float | Round 2 Time Faults
round2_in_team | float | Round 2 calculated Team result
omh2f | float | Round 3 Faults
omh2t | float | Round 3 Time
tf2 | float | Round 3 Time Faults
round3_in_team | float | Round 3 calculated Team result
omg3f | float | Round 4 Faults
omg3t | float | Round 4 Time
tf3 | float | Round 4 Time Faults
round4_in_team | float | Round 4 calculated Team result
omg4f | float | Round 5 Faults
omg4t | float | Round 5 Time
tf4 | float | Round 5 Time Faults
round5_in_team | float | Round 5 calculated Team result
omg5f | float | Round 6 Faults
omg5t | float | Round 6 Time
tf5 | float | Round 6 Time Faults
round6_in_team | float | Round 6 calculated Team result
or | string | Reason <ul><li><strong>U</strong> = Retired</li><li><strong>D</strong> = Eliminated</li><li><strong>S</strong> = Disqualified</li></ul> *Use this in combination with `judgement.json`'s `eliminated_faults` field to determine in which round the rider was eliminated or retired.*
a | string | Status <ul><li><strong>Ö</strong> = Withdrawn</li><li><strong>E</strong> = Unpaid withdrawn</li><li><strong>U</strong> = No-show</li><li><strong>B</strong> = Changed competition</li><li><strong>R</strong> = Reserve</li></ul> *Count as not started*
