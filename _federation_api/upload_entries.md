---
title: Upload entries
position: 1.9
type: post
description: This is a useful option if your federation is not yet ready to commit to our standard format. You can build your own service that converts the entry file given by the entry system.
right_code: |
  ~~~ http
  HTTP/1.1 202 Accepted
  ~~~
  {: title="Success" }

  ~~~ http
  HTTP/1.1 401 Unauthorized
  ~~~
  {: title="Error" }
---
Make sure that you have specified **Upload entry file URL** under settings for your federation in app.equipe.com.
{: .info }

* The user upload the entry file to Equipe
* Equipe will in the background make a post with the data untouched to `Entry file upload URL`, the Content-Type header is set as it was received by the user, the request.body contains the file content.
* You convert the entry file, and return our format for entries, see above **Entries**
* Equipe import the information, and tracks changes. The user will be able to import the entries serveral times.
