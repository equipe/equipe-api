---
title: Errors
description: When something goes wrong
position: 2.1
right_code: |
  ~~~ json
  [
    "The property '#/people/0/id' of type integer did not match the following type: string in schema file:///Users/jon/code/equipe_app/docs/api/schemas/entries.json#",
    "The property '#/entries/0/competition_no' of type integer did not match the following type: string in schema file:///Users/jon/code/equipe_app/docs/api/schemas/entries.json#"
  ]  
  ~~~
  {: title="Validation error" }
---
We communicate errors as they occur. Data validation errors will be presented to the user requesting the information. When validation error happens we will show the errors and with the data being validated under the link **Show context**

If our requests fail we will show the bubble up the error to the user interface.

If something goes wrong internally in our system we will present internal server error.

We hope you get enough information if something goes wrong to be able to track the error.
