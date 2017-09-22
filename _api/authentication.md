---
title: Authentication
description: Add the API key to all requests as a GET parameter or set X-API-KEY header.
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

Login to your account. Visit you profile page and click show API-Key. This key should be set in the **X-API-KEY** header or **api_key** parameter on every request.
{: .info }

You need to be authenticated for all API requests. You can manage your **API-Key** from your profile. You will be prompted to enter your password to view your key or regenerate it.

Nothing will work unless you include this API key
{: .error }
