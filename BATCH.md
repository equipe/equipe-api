# Batch API

This API endpoint enables the batch processing of multiple models including people, horses, clubs, competitions, schedules, teams and starts in a specific meeting.

- The top-level `key` one of `people`, `horses`, `clubs`, `competitions`, `schedules`, `teams` and `starts`
  - `unique_by` Required. Specifies the field to identify unique records.
  - `skip_user_changed` Don't override manually changes done by humans (non imports etc)
  - `where` Conditions to narrow down the operation.
  - `replace` Boolean indicating if existing records should be replaced. Only supported when `where` conditions also set.
  - `abort_if_any` Conditions to abort the operation if any criteria match.
  - `records` An array of records to be processed.

Relationships are set by naming the record you point at, like `"rider": { "foreign_id": "939" }`. Look it up by a column that exists on that record. `foreign_id` is normally the one you want, since it holds the id from your own system.

In the example below, the start list will not be updated if any of the starts is set as rid (marked as ridden).

The header X-Transaction-Uuid is optional but recommended. It groups all updates to a single block, allowing the user to undo them with one click under activities.

```http
POST /meetings/{{meeting_id}}/batch HTTP/1.1
X-Api-Key: {{api_key}}
X-Transaction-Uuid: {{your-newly-generated-uuid-to-group-all-operations}}
Accept: application/json
Content-Type: application/json

{
  "people": {
    "unique_by": "foreign_id",
    "records": [
      {
        "foreign_id": "939",
        "first_name": "Lyndon",
        "last_name": "Johns",
        "country": "GER",
        "licence": "4092405"
      }
    ]
  },
  "horses": {
    "unique_by": "foreign_id",
    "records": [
      {
        "foreign_id": "3330",
        "num": "199",
        "name": "FIREFLY W",
        "breed": "Dutch Warmblood",
        "sex": "val",
        "born_year": "2010",
        "sire": "Nebab de Reve",
        "dam_sire": "Voltaire",
        "owner": "Spruce Meadows Ltd.",
        "category": "H",
        "fei_id": "105BI25"
      }
    ]
  },
  "starts": {
    "unique_by": "foreign_id",
    "where": {
      "competition": {
        "foreign_id": "2686-889-84"
      }
    },
    "abort_if_any": {
      "rid": true
    },
    "replace": true,
    "records": [
      {
        "foreign_id": "6a08c0cb9fef0bd40ac1f2247efa1249",
        "st": "1",
        "ord": 1,
        "rider": {
          "foreign_id": "939"
        },
        "horse": {
          "foreign_id": "3330"
        }
      }
    ]
  },
  "competitions": {
    "unique_by": "foreign_id",
    "skip_user_changed": true,
    "records": [
      {
        "foreign_id": "2686-889-84",
        "clabb": "276",
        "name": "Jumper - 1.30m",
        "starts_on": "2024-03-17",
        "arena": "Radiant Domain",
        "start_time": "09:00",
        "officials_data": [
          {
            "type": "course_designer",
            "name": "Isaiah Nightingale",
            "country": "GBR"
          }
        ]
      }
    ]
  }
}

```

## Team Competition Example

This example shows how to import a team competition with teams, riders, horses, and starts all linked together:

```http
POST /meetings/{{meeting_id}}/batch HTTP/1.1
X-Api-Key: {{api_key}}
X-Transaction-Uuid: {{your-newly-generated-uuid-to-group-all-operations}}
Accept: application/json
Content-Type: application/json

{
  "clubs": {
    "unique_by": "foreign_id",
    "records": [
      {
        "foreign_id": "club_001",
        "name": "Equestrian Club Stockholm",
        "logo_id": "SWE",
        "logo_group": "flags48"
      },
      {
        "foreign_id": "club_002",
        "name": "Oslo Riding Academy",
        "logo_id": "NOR",
        "logo_group": "flags48"
      }
    ]
  },
  "people": {
    "unique_by": "foreign_id",
    "skip_user_changed": true,
    "records": [
      {
        "foreign_id": "payer_001",
        "fornamn": "Lars",
        "efternamn": "Larsson",
        "country": "SWE",
        "email": "lars.larsson@example.com",
        "telefon": "+46701234567"
      },
      {
        "foreign_id": "rider_001",
        "fornamn": "Emma",
        "efternamn": "Andersson",
        "country": "SWE",
        "licence": "SWE12345"
      },
      {
        "foreign_id": "rider_002",
        "fornamn": "Olivia",
        "efternamn": "Nilsson",
        "country": "SWE",
        "licence": "SWE12346"
      },
      {
        "foreign_id": "rider_003",
        "fornamn": "William",
        "efternamn": "Johansson",
        "country": "SWE",
        "licence": "SWE12347"
      },
      {
        "foreign_id": "rider_004",
        "fornamn": "Noah",
        "efternamn": "Eriksson",
        "country": "SWE",
        "licence": "SWE12348"
      }
    ]
  },
  "horses": {
    "unique_by": "foreign_id",
    "records": [
      {
        "foreign_id": "horse_001",
        "name": "Thunder Strike",
        "category": "H",
        "breed": "Swedish Warmblood",
        "born_year": "2015",
        "country": "SWE"
      },
      {
        "foreign_id": "horse_002",
        "name": "Lightning Bolt",
        "category": "H",
        "breed": "Hanoverian",
        "born_year": "2014",
        "country": "GER"
      },
      {
        "foreign_id": "horse_003",
        "name": "Storm Cloud",
        "category": "H",
        "breed": "KWPN",
        "born_year": "2016",
        "country": "NED"
      },
      {
        "foreign_id": "horse_004",
        "name": "Wind Dancer",
        "category": "H",
        "breed": "Oldenburg",
        "born_year": "2015",
        "country": "GER"
      }
    ]
  },
  "competitions": {
    "unique_by": "foreign_id",
    "records": [
      {
        "foreign_id": "comp_team_001",
        "clabb": "301",
        "name": "Team Jumping - 1.20m",
        "status": "N",
        "starts_on": "2024-03-20",
        "discipline": "H",
        "horse_pony": "R",
        "team": true,
        "arena": "Main Arena",
        "start_time": "14:00"
      }
    ]
  },
  "teams": {
    "unique_by": "foreign_id",
    "where": {
      "competition": { "foreign_id": "comp_team_001" }
    },
    "records": [
      {
        "foreign_id": "team_001",
        "st": 1,
        "ord": 1,
        "lagnr": 1,
        "lagledare": "Coach Anna Svensson",
        "club": { "foreign_id": "club_001" },
        "payer": { "foreign_id": "payer_001" }
      }
    ]
  },
  "starts": {
    "unique_by": "foreign_id",
    "where": {
      "competition": { "foreign_id": "comp_team_001" }
    },
    "replace": true,
    "records": [
      {
        "foreign_id": "start_001",
        "st": 1,
        "ord": 1,
        "category": "H",
        "section": "A",
        "rider": { "foreign_id": "rider_001" },
        "horse": { "foreign_id": "horse_001" },
        "team": { "foreign_id": "team_001" },
        "club": { "foreign_id": "club_001" }
      },
      {
        "foreign_id": "start_002",
        "st": 2,
        "ord": 2,
        "category": "H",
        "section": "A",
        "rider": { "foreign_id": "rider_002" },
        "horse": { "foreign_id": "horse_002" },
        "team": { "foreign_id": "team_001" },
        "club": { "foreign_id": "club_001" }
      },
      {
        "foreign_id": "start_003",
        "st": 3,
        "ord": 3,
        "category": "H",
        "section": "A",
        "rider": { "foreign_id": "rider_003" },
        "horse": { "foreign_id": "horse_003" },
        "team": { "foreign_id": "team_001" },
        "club": { "foreign_id": "club_001" }
      },
      {
        "foreign_id": "start_004",
        "st": 4,
        "ord": 4,
        "category": "H",
        "section": "A",
        "rider": { "foreign_id": "rider_004" },
        "horse": { "foreign_id": "horse_004" },
        "team": { "foreign_id": "team_001" },
        "club": { "foreign_id": "club_001" }
      }
    ]
  }
}
```

In this team competition example:
- One team is created with 4 team members (starts)
- Each start is linked to a rider, horse, the team, and the club
- The competition has `team: true` to enable team functionality
- All relationships are maintained through `foreign_id` references

## Errors

When something in the batch cannot be carried out you get a `422` back with the reason.

```json
{
  "errors": [
    {
      "attribute": "unique_by",
      "message": "starts: unique_by is required",
      "code": "blank"
    }
  ]
}
```

`attribute` points at the part of your request to look at, and the message starts with the collection it came from. The ones you are most likely to hit:

- `unique_by is required` The instruction has no `unique_by`, so there is no way to tell which record a row is.
- `personer has no column id` A relationship is looked up by a column that table does not have. Riders are keyed by `rnr`, not `id`.
- `rider must be given as an object of columns to look it up by` A relationship was sent as a plain value instead of an object.

When a record is rejected by validation you get the same shape, plus the record as it was about to be saved.

```json
{
  "errors": [
    {
      "attribute": "last_name",
      "message": "can't be blank",
      "code": "blank"
    }
  ],
  "record": {}
}
```

Collections are processed in the order `people`, `horses`, `clubs`, `competitions`, `schedules`, `teams`, `starts`, and the batch is not one transaction. If `starts` fails, the people and horses from the same request are already saved. Sending the whole batch again is safe, since every record is matched on its `unique_by` and updated instead of added twice.

