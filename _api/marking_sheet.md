---
title: Marking Sheet
description: Get Marking Sheet
type: get
position: 5
right_code: |
  ~~~ json
  {
    "id":10007,
    "name":"FEI Dressage Test Nr 6",
    "year":"2002",
    "course_length":"100",
    "time":"9",
    "t":"A",
    "sp":"E",
    "ord":150,
    "max_score":200,
    "scale":10,
    "bridle":"",
    "deduction":null,
    "sort_desc":null,
    "federation":"ERL",
    "items":[
      {
        "index":0,
        "section":"technical",
        "group_no":"1",
        "coefficient":1,
        "keyword":"",
        "positions":[
          "A",
          "X",
          "",
          "XCH"
        ],
        "rows":[
          "Enter ar working tot",
          "Halt - Salute",
          "Proceed at working trot",
          "Track to the left"
        ]
      },
      {
        "index":1,
        "section":"technical",
        "group_no":"2",
        "coefficient":1,
        "keyword":"",
        "positions":[
          "HX",
          "X",
          "",
          "KAF"
        ],
        "rows":[
          "Collected trot",
          "Reins in one hand an circle to the right,",
          "20 m diameter",
          "Working trot and reins at will"
        ]
      }
    ]
  }
  ~~~
  {: title="Response" }
---

Returns a specific marking sheet from your collection

~~~ bash
curl /federations/YOUR_FEDERATION_ID/marking_sheets.json?api_key=YOUR_APP_KEY
~~~
{: title="Curl" }
