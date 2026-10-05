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
