---
title: Authentication
position: 1
right_code: |
  ~~~ bash
  # Using X-API-KEY header
  curl -H "X-API-KEY: YOUR_APP_KEY" "https://app.equipe.com/organizers/1/meetings.json"
  ~~~
  {: title="Curl with HTTP headers" }

  ~~~ bash
  # Using parameters
  curl https://app.equipe.com/organizers/1/meetings?api_key=YOUR_APP_KEY
  ~~~
  {: title="Curl with parameters" }
---

You need to be authenticated for all API requests. You can find or regenerate the API key on your profile page.

Add the API key to all requests as a GET parameter or set X-API-KEY header.

Nothing will work unless you include this API key
{: .error }
