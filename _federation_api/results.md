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
