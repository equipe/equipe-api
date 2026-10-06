---
title: Results
position: 2.0
type: post
description: Get results from Equipe
right_code: |
  ~~~ http
  HTTP/1.1 202 Accepted
  ~~~
  {: title="Success" }

  ~~~ http
  HTTP/1.1 401 Unauthorized
  ~~~
  {: title="Error" }

  ~~~ http
  HTTP/1.1 422 Unprocessable entity
  Content-Type: application/json
  ~~~
  {: title="Validation error" }
---
We support 3 different ways of exporting results.

* Submit results directly to the federation in our format
* Submit results to an external converter that transform our format to standard of the given federation, the file is downloaded and submitted manually to the federation by the user.
* Download results in our format directly from the system

### Submit results

Make sure that you have specified **Results URL** under settings for your federation in app.equipe.com.
{: .info }


#### Format

The result format has similar structure as the entries. But instead of entries, we export the starts. [See example](https://github.com/equipe/equipe_api/blob/master/examples/results.json)

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

When the user exports the results, our system will make an `HTTP POST` with content type of `application/json` the request body contains the results in json format. If you accept the file, return status `202 Accepted` to our system knows that the file is accepted.

In case of your own validation fails, the error needs to be communicated back to the user that tries to send the results.

Return `422 Unprocessable entity` with content type `application/json` and the body should contain the error messages in json format as following

~~~http
HTTP/1.1 422 Unprocessable entity
Content-Type: application/json
{
 "errors": ["Missing licence of rider XXX"]
}
~~~

### Submit the results to external converter

Make sure that you have specified **Result File URL** under settings for your federation in app.equipe.com.
{: .info }

When the user initialize the export, our system will make an `HTTP POST` with content type of `application/json` the request body contain the results in json format. You transform the file and return in in the body with the correct content type set. We will then forward this to the user and the file will be downloaded automatically and the user can submit it to the federation.

In case of invalid result data return json response contain the error message with the status code `422 Unprocessable entity` as the example above.

### Download our result

This option is default if non of the above is specified. It will export the result data in our JSON-format to a file that will be downloaded.

### Results of a start

Every start in `starts` has its results in `results`, one object per round or test, with the kind of result in `type`. Which types a start has depends on the discipline of the competition, as described below. The start itself also has `rank`, the placing in the competition, and `result_preview`, the result as it is shown in the result list.

A team in `teams` has `results` in the same way for show jumping, dressage and working equitation. In the other disciplines the team has an empty `results` array, and the results are on the starts of the members.

The starts in a competition in a discipline that is not described below, for example breed evaluation, exhibition or pony measurement, have an empty `results` array.
{: .info }

### Show jumping results

A show jumping start has one result per round of the competition, also for the rounds it has not ridden yet. When rounds are added together, a `show_jumping_total` follows the last round that counts in the total.

```json
"results": [
  {
    "type": "show_jumping",
    "round_no": 1,
    "faults": 5.0,
    "time_faults": 1.0,
    "time": 76.12,
    "fence_faults": 4.0
  },
  {
    "type": "show_jumping",
    "round_no": 2,
    "faults": 0.0,
    "time_faults": 0.0,
    "time": 68.4,
    "fence_faults": 0.0
  },
  {
    "type": "show_jumping_total",
    "round_no": 3,
    "faults": 5.0
  }
]
```

`round_no` numbers the rounds and the totals in one sequence, in the order they come. Two rounds that are added together and then a jump-off give round 1, round 2, the total as 3 and the jump-off as 4.

A round that is not ridden yet has `null` values.
{: .info }

#### Round

| Attribute    | Type    | Description                                                                 |
|--------------|---------|-----------------------------------------------------------------------------|
| type         | string  | `show_jumping`                                                              |
| round_no     | integer | The place of the round among the results, see above                        |
| faults       | number  | The penalties of the round, fence faults and time faults together. In a round with penalty seconds (table C) these are the penalty seconds |
| time_faults  | number  | The time faults. Left out when the round has no time                        |
| time         | number  | The time in seconds. In a round with penalty seconds the time includes them. Left out when the round has no time |
| fence_faults | number  | The faults at the fences, without the time faults                           |
| score        | number  | Only in a round judged with a marking sheet, for example style jumping. The score of the round |
| score_sheets | array   | Only in a round judged with a marking sheet. One object per judge. `judge_by` is the position of the judge and `points` are the marks as strings in the order of the sheet. A missing mark is an empty string |
| status       | string  | Set when the start did not complete the round. One of "EL" (eliminated), "RET" (retired), "WD" (withdrawn), "SUSP" (disqualified), "NS" (not started) |

#### Total

| Attribute | Type    | Description                                                                    |
|-----------|---------|--------------------------------------------------------------------------------|
| type      | string  | `show_jumping_total`                                                           |
| round_no  | integer | The place of the total among the results                                       |
| faults    | number  | The sum of the faults of the rounds that count in the total. Left out when the start is eliminated |

#### Teams

A team has the same types. A round has `round_no`, `faults`, `time` when the round has time, and `status` when the team did not complete the round. The total has `round_no` and `faults`.

```json
"results": [
  { "type": "show_jumping", "round_no": 1, "faults": 8.0, "time": 221.45 },
  { "type": "show_jumping", "round_no": 2, "faults": 4.0, "time": 218.02 },
  { "type": "show_jumping_total", "round_no": 3, "faults": 12.0 }
]
```

### Dressage results

A dressage start has one result per judge, in the order of the judges, and `dressage_total` last.

```json
"results": [
  {
    "type": "dressage",
    "judge_by": "E",
    "scoresheet": [7.0, 6.5, 7.0, 8.0, 7.5],
    "rank": 2,
    "score": 285.5,
    "percent": 69.634
  },
  {
    "type": "dressage",
    "judge_by": "C",
    "scoresheet": [7.5, 7.0, 7.0, 8.0, 8.0],
    "rank": 1,
    "score": 291.0,
    "percent": 70.976
  },
  {
    "type": "dressage_total",
    "score": 576.5,
    "percent": 70.305,
    "rank": 1
  }
]
```

A judge that has not marked the ride yet still has a result, with `null` values.
{: .info }

#### Judge

| Attribute         | Type    | Description                                                            |
|-------------------|---------|------------------------------------------------------------------------|
| type              | string  | `dressage`                                                             |
| judge_by          | string  | The position of the judge, for example "C"                             |
| scoresheet        | array   | The marks of the judge in the order of the sheet. A missing mark is `null` |
| rank              | integer | The placing at this judge                                              |
| score             | number  | The points from the judge. Not in a freestyle test                     |
| percent           | number  | The result from the judge in percent                                   |
| technical         | number  | Freestyle only. The technical points                                   |
| artistic          | number  | Freestyle only. The artistic points                                    |
| technical_percent | number  | Freestyle only. The technical result in percent                        |
| artistic_percent  | number  | Freestyle only. The artistic result in percent                         |

#### Total

| Attribute         | Type    | Description                                                            |
|-------------------|---------|------------------------------------------------------------------------|
| type              | string  | `dressage_total`                                                       |
| score             | number  | The sum of the points from all judges                                  |
| percent           | number  | The result in percent                                                  |
| technical_percent | number  | Freestyle only. The technical result in percent                        |
| artistic_percent  | number  | Freestyle only. The artistic result in percent                         |
| rank              | integer | The placing in the competition                                         |
| status            | string  | Set when the start did not complete the test, with the same values as in show jumping |

#### Teams

A team has one result, `dressage_total`, with `percent` and `rank`.

```json
"results": [
  { "type": "dressage_total", "percent": 71.248, "rank": 1 }
]
```

### Eventing results

An eventing start has the results of the tests in the order they are ridden, and `eventing_total` last. The dressage gives one `dressage` result per judge and a `dressage_total` as above, the jumping gives `show_jumping` and the cross country gives `cross_country`. A test that comes after the one where the start was eliminated, retired or withdrawn is left out.

```json
"results": [
  { "type": "dressage", "judge_by": "C", "scoresheet": [7.0, 6.5, 7.0, 8.0], "rank": 3, "score": 199.5, "percent": 70.0 },
  { "type": "dressage_total", "score": 199.5, "percent": 70.0, "penalty_points": 30.0, "rank": 3 },
  { "type": "show_jumping", "penalty_points": 4.0, "rank": 2, "faults": 4.0, "time_faults": 0.0, "time": 72.5 },
  {
    "type": "cross_country",
    "penalty_points": 13.4,
    "rank": 2,
    "faults": 13.4,
    "time_faults": 2.4,
    "time_diff": 6,
    "time": 366,
    "scoresheet": { "12b": ["mf"] }
  },
  { "type": "eventing_total", "rank": 2, "penalty_points": 47.4 }
]
```

#### Dressage

The dressage results have the same attributes as in a dressage competition. In addition, `dressage_total` has `penalty_points`, the penalty points from the dressage, and `rank` is the placing after the dressage. `status` is only set when the start is out of the competition in the dressage.

#### Jumping

| Attribute      | Type    | Description                                                           |
|----------------|---------|-----------------------------------------------------------------------|
| type           | string  | `show_jumping`                                                        |
| penalty_points | number  | The penalty points from the jumping                                   |
| rank           | integer | The placing after the jumping, with the tests before it included      |
| faults         | number  | The faults of the round                                               |
| time_faults    | number  | The time faults                                                       |
| time           | number  | The time in seconds                                                   |
| status         | string  | Set when the start was eliminated in the jumping. One of "EL" (eliminated), "RET" (retired), "WD" (withdrawn). The other attributes are then left out |

#### Cross country

| Attribute      | Type    | Description                                                           |
|----------------|---------|-----------------------------------------------------------------------|
| type           | string  | `cross_country`                                                       |
| penalty_points | number  | The penalty points from the cross country                             |
| rank           | integer | The placing after the cross country, with the tests before it included |
| faults         | number  | The same value as `penalty_points`                                    |
| time_faults    | number  | The time penalties                                                    |
| time_diff      | number  | The difference in seconds between the time and the optimum time      |
| time           | integer | The time in whole seconds                                             |
| scoresheet     | object  | The fences that have something marked. The key is the fence as it is named in the course, and the value is a list of codes: "-" (clear), "1r", "2r", "3r" (refusals), "bfd" (breaking a frangible obstacle), "fR" (fall rider), "fH" (fall horse), "fof" (fall on flat), "dr" (dangerous riding), "mf" (missing a flag), "th" (trapped horse), "fs" (false start), "ec" (error of course), "gj" (stopped by the ground jury), "rt" (retired), "el" (eliminated), "dq" (disqualified), "wd" (withdrawn), "ur" (under review), "?" (unreported) |
| style          | number  | The style score, when the competition has one. Left out when the start is eliminated |
| status         | string  | Set when the start was eliminated in the cross country, with the same values as for the jumping |

An attribute without a value is left out of `cross_country`.
{: .info }

#### Total

| Attribute      | Type    | Description                                                           |
|----------------|---------|-----------------------------------------------------------------------|
| type           | string  | `eventing_total`                                                      |
| rank           | integer | The placing in the competition                                        |
| penalty_points | number  | The sum of the penalty points from the tests                          |

`eventing_total` is only there when the start has penalty points and is not eliminated.

### Combined training results

A combined training start has the same results as in eventing for the dressage and the jumping, and `combined_training_total` last.

| Attribute      | Type    | Description                                                           |
|----------------|---------|-----------------------------------------------------------------------|
| type           | string  | `combined_training_total`                                             |
| rank           | integer | The placing in the competition                                        |
| penalty_points | number  | The sum of the penalty points from the tests. A test that is set up as a deduction is subtracted |

`combined_training_total` is only there when the start has penalty points and is not eliminated.

### Endurance results

For endurance, `results` is an object and not an array. It holds the totals of the start and one entry per gate in `phases`, with the gate number as key. Times are strings in the format `hh:mm:ss`, and the `_ticks` attributes have the same times in milliseconds.

```json
"results": {
  "last_gate": 1,
  "total_time": "01:25:10",
  "total_ticks": 5110000,
  "average_speed": 14.09,
  "phases": {
    "1": {
      "started": true,
      "departure_time": "07:00:00",
      "arrival_time": "08:22:30",
      "ttp1_time": "08:25:10",
      "ttp1_pulse": 60,
      "recovery_time": "00:02:40",
      "phase_time": "01:25:10",
      "phase_ticks": 5110000,
      "phase_speed": 14.09,
      "total_time": "01:25:10",
      "total_ticks": 5110000,
      "average_speed": 14.09,
      "rank": 3
    }
  }
}
```

#### Start

| Attribute             | Type    | Description                                                       |
|-----------------------|---------|-------------------------------------------------------------------|
| last_gate             | integer | The last gate the start has passed                                |
| total_time            | string  | The total riding time                                             |
| total_ticks           | integer | The total riding time in milliseconds                             |
| average_speed         | number  | The average speed, per hour in the distance unit of the competition |
| total_ideal_diff_time | string  | Ideal time competitions only. The total difference to the ideal time |
| total_ideal_diff_ticks| integer | Ideal time competitions only. The same in milliseconds            |
| phases                | object  | One object per gate, with the gate number as key                  |

#### Phase

| Attribute             | Type    | Description                                                       |
|-----------------------|---------|-------------------------------------------------------------------|
| started               | boolean | True when the start has begun the phase                           |
| departure_time        | string  | The time of departure                                             |
| arrival_time          | string  | The time of arrival                                               |
| ttp1_time, ttp1_pulse | string, integer | The time of the first presentation and the pulse          |
| ttp2_time, ttp2_pulse | string, integer | The time of the second presentation and the pulse, when the horse is presented again |
| recovery_time         | string  | The time from arrival to presentation                             |
| phase_time            | string  | The riding time of the phase                                      |
| phase_ticks           | integer | The same in milliseconds                                          |
| phase_speed           | number  | The speed of the phase, per hour in the distance unit of the competition |
| total_time            | string  | The riding time up to and including this phase                    |
| total_ticks           | integer | The same in milliseconds                                          |
| average_speed         | number  | The average speed up to and including this phase                  |
| rank                  | integer | The placing after this phase                                      |
| reason                | string  | Set when the start is out. One of "RET" (retired), "DSQ" (disqualified), "FNR" (finished not ranked), "FTQ" (failed to qualify) |
| reason_complement     | string  | The cause, for example "GA" (irregular gait), "ME" (metabolic) or "OT" (out of time) |
| vet_inspection        | string  | Where the reason was given. One of "first" (first horse inspection), "standard" (gate), "final" (final horse inspection) |

An attribute without a value is `null` or left out.
{: .info }

### Score summary results

A score summary start has one `score_summary` per competition the summary is made of, in the order they are set up, and `score_summary_total` last.

```json
"results": [
  { "type": "score_summary", "score": 72.5 },
  { "type": "score_summary", "score": 68.25 },
  { "type": "score_summary_total", "score": 140.75 }
]
```

| Attribute | Type    | Description                                                                   |
|-----------|---------|-------------------------------------------------------------------------------|
| type      | string  | `score_summary` or `score_summary_total`                                      |
| score     | number  | The score from the competition, or the total score. Left out when there is no score |

### Working equitation results

A working equitation competition has up to three tests: dressage, ease of handling and speed. Every start has one result per test, in the order the tests are ridden, and the total last. The test names are the same as in `judgement.tests` on the competition: `dressage`, `eoh` and `speed`.

```json
"results": [
  {
    "type": "working_equitation_dressage",
    "rank": 1,
    "score": 10,
    "percent": 70.333,
    "score_sheets": [
      { "judge_by": "C", "points": [7.0, 6.5, 7.0, 8.0, 7.5] }
    ]
  },
  {
    "type": "working_equitation_eoh",
    "rank": 1,
    "score": 10,
    "percent": 73.158,
    "score_sheets": [
      { "judge_by": "C", "points": [7.0, 8.0, 6.0, 7.5, null] }
    ]
  },
  {
    "type": "working_equitation_speed",
    "rank": 2,
    "score": 8,
    "time": 104.5,
    "time_penalty": 10.0,
    "time_bonus": -5.0,
    "total": 109.5
  },
  {
    "type": "working_equitation_total",
    "rank": 1,
    "score": 28
  }
]
```

An attribute without a value is left out. A test that is not ridden yet has no rank, score or result.
{: .info }

#### Dressage and ease of handling

`working_equitation_dressage` and `working_equitation_eoh` have the same attributes.

| Attribute    | Type    | Description                                                                 |
|--------------|---------|-----------------------------------------------------------------------------|
| type         | string  | `working_equitation_dressage` or `working_equitation_eoh`                   |
| rank         | integer | The placing in the test                                                     |
| score        | number  | The points the placing gives. 0 when the test has a status                  |
| percent      | number  | The result of the test in percent                                           |
| status       | string  | Set when the test was not completed. One of "EL" (eliminated), "RET" (retired), "SUSP" (disqualified), "WD" (withdrawn). The test then has no percent |
| score_sheets | array   | One object per judge that has marked the ride. `judge_by` is the position of the judge and `points` are the marks in the order of the sheet. A missing mark is `null` |
| included     | boolean | Only for a member of a team. True when the test counts for the team         |

The marks for dressage follow the items of the dressage test. The marks for ease of handling follow the obstacles of the course, then the collective marks.

#### Speed

| Attribute    | Type    | Description                                                                 |
|--------------|---------|-----------------------------------------------------------------------------|
| type         | string  | `working_equitation_speed`                                                  |
| rank         | integer | The placing in the test                                                     |
| score        | number  | The points the placing gives. 0 when the test has a status                  |
| time         | number  | The ridden time in seconds                                                  |
| time_penalty | number  | Penalty seconds added to the time                                           |
| time_bonus   | number  | Bonus seconds taken off the time, as a negative number                      |
| total        | number  | The result of the test in seconds: `time` plus `time_penalty` plus `time_bonus` |
| status       | string  | Set when the test was not completed, with the same values as above. The test then has no times |
| included     | boolean | Only for a member of a team. True when the test counts for the team         |

#### Total

| Attribute | Type    | Description                                                                    |
|-----------|---------|--------------------------------------------------------------------------------|
| type      | string  | `working_equitation_total`                                                     |
| rank      | integer | The placing in the competition                                                 |
| score     | number  | The sum of the points from the tests. 0 when one of the tests has a status     |
| status    | string  | Set when the start is out of the whole competition, with the same values as above |

#### Teams

A team has one result per test and the total last. The `score` of a test is the sum of the points from the members that count in that test.

```json
"results": [
  { "type": "working_equitation_dressage", "score": 22.0 },
  { "type": "working_equitation_eoh", "score": 28.0 },
  { "type": "working_equitation_speed", "score": 21.0 },
  { "type": "working_equitation_total", "score": 71.0, "rank": 1 }
]
```

The members of the team are in `starts`, with the id of the team in `team_id`. Each test of a member has `included`, so you can see which members counted in which test.
