---
title: Errors
description: Commonly used HTTP status codes
position: 10
right_code: |
  ~~~ http
  HTTP/1.1 200 OK
  ~~~
  {: title="Success" }

  ~~~ http
  HTTP/1.1 401 Unauthorized
  ~~~
  {: title="Error" }

---

| Code | Name                   | Description                      |
|------|------------------------|----------------------------------|
| 200  | OK                     | Success                          |
| 201  | Created                | Creation Successful              |
| 202  | Accepted               | Accepted but not yet proccessed  |
| 400  | Bad Request            | We could not process that action |
| 401  | Unauthorized           | We could not authenticate        |
| 403  | Forbidden              | We couldn't authenticate you     |
| 422  | Unprocessable entity   | Validiation failed               |
