# Scene

> [!IMPORTANT]
> Working in progress: This is a starting point for documenting some of the aspects of the scene JSON that builds up the graphics in our Equipe.

## Introduction

In this guide, you’ll find examples that illustrate how to configure various scenarios. Whether you’re setting up a simple countdown or handling more complex state transitions with multiple rule blocks, understanding this structure will help you design scoreboards that are both visually appealing and functionally robust.

## Rules

The rules can appear in several places within the scene JSON. They can be defined at the top level, which determines which scene is displayed (unless the scene is locked; in that case, it has a red border and no rule will trigger a scene switch).

The order of the scenes matters because the scoreboard will display the first scene that meets the criteria.


```json
{
  "name": "Demo Rules - countdown",
  "style": {
    "width": 1920,
    "height": 1080,
    "background": "linear-gradient(135deg, #0b132b 0%, #1c2541 50%, #1f4068 100%)"
  },
  "MatchersDocumentation": [
    "equal - alias for eq.",
    "notEqual - alias for ne.",
    "eq - Returns true if values are strictly equal (using ===).",
    "ne - Returns true if values are not strictly equal (using !==).",
    "gt - Returns true if the first value is greater than the second.",
    "gte - Returns true if the first value is greater than or equal to the second.",
    "lt - Returns true if the first value is less than the second.",
    "lte - Returns true if the first value is less than or equal to the second.",
    "be - Returns true if the boolean conversion of the first value strictly equals the second."
  ],
  "comments": [
    "countDown must equal true AND running must equal false.",
    "Only when both of these conditions are satisfied will the 'eq' evaluation return true.",
    "If either one of them fails to match, the overall evaluation will be false."
  ],
  "rules": {
    "eq": {
      "countDown": true,
      "running": false
    }
  },
  "disableCols": true,
  "layout": [
    {
      "component": "Flex",
      "justifyContent": "center",
      "alignItems": "center",
      "style": {
        "height": "100%"
      },
      "items": [
        {
          "component": "Text",
          "value": "45 Count down",
          "style": {
            "fontSize": "124px",
            "width": "auto"
          }
        }
      ]
    }
  ]
}
```

> [!TIP]
> The names of the matchers can include any digit at the end, so you can use the operator again on again.


```json
{
  "name": "Demo Rules - time to beat",
  "style": {
    "width": 1920,
    "height": 1080,
    "background": "linear-gradient(135deg, #0b132b 0%, #1c2541 50%, #1f4068 100%)"
  },
  "comments": [
    "This configuration defines two separate rule blocks",
    "The first rule block (matcher eq) requires that nodeActivated is equal to split.",
    "The second rule block (matcher eq) requires that nodeActivated is equal to finish.",
    "The overall evaluation logic works like an OR—if either of these rule blocks evaluates to true, then the overall condition is considered true."
  ],
  "rules": {
    "eq": {
      "nodeActivated": "split"
    },
    "eq2": {
      "nodeActivated": "finish"
    }
  },
  "notes": [
    "The names of the matchers can include any digit at the end (e.g., eq3, ne2, lte4, etc.).",
    "These numeric suffixes do not affect the evaluation logic.",
    "In this case, appending digits (e.g., eq, eq2, eq3, etc.) ensures each rule block has a unique key, even though the numeric suffix does not affect how the conditions are evaluated"
  ],
  "disableCols": true,
  "layout": [
    {
      "component": "Flex",
      "justifyContent": "center",
      "alignItems": "center",
      "style": {
        "height": "100%"
      },
      "items": [
        {
          "component": "Text",
          "value": "Time to Beat",
          "style": {
            "fontSize": "124px",
            "width": "auto"
          }
        }
      ]
    }
  ]
}
```

```json
{
  "name": "Demo Rules - running",
  "style": {
    "width": 1920,
    "height": 1080,
    "background": "linear-gradient(135deg, #0b132b 0%, #1c2541 50%, #1f4068 100%)"
  },
  "rules": {
    "eq": {
      "running": true
    }
  },
  "disableCols": true,
  "layout": [
    {
      "component": "Flex",
      "justifyContent": "center",
      "alignItems": "center",
      "style": {
        "height": "100%"
      },
      "items": [
        {
          "component": "Text",
          "value": "Running",
          "style": {
            "fontSize": "124px",
            "width": "auto"
          }
        }
      ]
    }
  ]
}
```

```json
{
  "name": "Demo Rules - waiting",
  "style": {
    "width": 1920,
    "height": 1080,
    "lineHeight": "1.3",
    "background": "linear-gradient(135deg, #0b132b 0%, #1c2541 50%, #1f4068 100%)"
  },
  "rules": {
    "eq": {
      "waiting": true
    }
  },
  "disableCols": true,
  "layout": [
    {
      "component": "Flex",
      "justifyContent": "center",
      "alignItems": "center",
      "style": {
        "height": "100%"
      },
      "items": [
        {
          "component": "Text",
          "value": "Waiting",
          "style": {
            "fontSize": "124px",
            "width": "auto"
          }
        }
      ]
    }
  ]
}
```

```json
{
  "name": "Demo Rules - ranked",
  "style": {
    "width": 1920,
    "height": 1080,
    "lineHeight": "1.3",
    "background": "linear-gradient(135deg, #0b132b 0%, #1c2541 50%, #1f4068 100%)"
  },
  "comments": [
    "The nested structure allows you to access deeper properties in the component’s state. Specifically, this rule checks that the value of current.re is not equal to 999"
  ],
  "rules": {
    "ne": {
      "current": {
        "re": 999
      }
    }
  },
  "disableCols": true,
  "layout": [
    {
      "component": "Flex",
      "justifyContent": "center",
      "alignItems": "center",
      "style": {
        "height": "100%"
      },
      "items": [
        {
          "component": "Text",
          "value": "Ranked",
          "style": {
            "fontSize": "124px",
            "width": "auto"
          }
        }
      ]
    }
  ]
}
```

What can you make rules on? Pretty much anything in the state of the scoreboard. I would recommend to install (React Developer Tools)[https://chromewebstore.google.com/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi] in your browser to see whats avaialbile.

The most common are

`running`
`waiting`
`countDown`
`nodeActivated` (start, split, finish)
`current`.`rank`

```json
{
  "id": 1,
  "running": false,
  "countDown": false,
  "nodeActivated": null,
  "countDownDiff": null,
  "timekeepingOutputId": 92,
  "baseTime": "1.65",
  "time": "1.65",
  "phase": 2,
  "round": 2,
  "previousTime": 0.64,
  "faults": 0,
  "fenceFaults": 0,
  "timeFaults": 0,
  "totalFaults": null,
  "countDownValue": "-44.4",
  "timeToBeatDiff": "+0.83",
  "isEliminated": false
  "current": {
      "id": 1,
      "ord": 1002,
      "st": 3,
      "rider_name": "Nick van Sante",
      "rider_name_order": "van SanteNick",
      "rider_first_name": "Nick",
      "rider_last_name": "van Sante",
      "rider_short_name": "N. van Sante",
      "horse_name": "Racal B",
      "horse_no": 3,
      "club_name": null,
      "logo_id": "NED",
      "logo_group": "flags48",
      "clabb_no": "1",
      "result_at": "2025-02-14T07:27:58.456193",
      "last_result_at": "2025-02-14T07:49:05.490056",
      ...
      "horse": {
          "hnr": 3,
          "fo": "1986",
          "far": "Rasso",
          "mor": "Cabella",
          "mormor": "",
          "mmf": "",
          "morfar": "Calypso I",
          "farg": "Bay",
          "breed": "BAVAR",
          "uppfodare": "Heinrich Sommer Simbach",
          "agare": "D. Charles",
          "f_land": "GER",
          "regnr": "",
          "kon": "val"
      }
  },
  "currentRound": {
      "fault_format": "%g",
      "new_start_signal": false,
      "output_base_time_as_time": null,
      "sum_in_total": false,
      "is_decisive": true,
      "order_by_ridden": true,
      ...
  },
  "rankedCount": 3,
  "remainingCount": 0,
  "participantsCount": 3,
  "timeToBeat": {
      "id": 2,
      "time": 0.82,
      "roundNo": 2,
      "holderShortName": "T. Kerssies",
      "type": "time_to_beat"
  },
  "previous": {
      "comment": "Same as current"
  },
  "competition": {
    "clabb": "1",
    "klass": "1.00m Table A. Two phases, the second against the clock (274.1.5.2)",
  }
}
```
