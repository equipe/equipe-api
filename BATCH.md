# Batch API

This API endpoint enables the batch processing of multiple models including people, horses, clubs, competitions, schedules and starts in a specific meeting.

- The top-level `key` one of `people`, `horses`, `clubs`, `competitions`, `schedules` and `starts`
  - `unique_by` Specifies the field to identify unique records.
  - `skip_user_changed` Don't override manually changes done by humans (non imports etc)
  - `where` Conditions to narrow down the operation.
  - `replace` Boolean indicating if existing records should be replaced. Only supported when `where` conditions also set.
  - `abort_if_any` Conditions to abort the operation if any criteria match.
  - `records` An array of records to be processed.

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


