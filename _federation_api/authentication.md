---
title: Authentication
description: All outgoing requests form Equipe with include Authentication headers
position: 1.2
right_code: |
  ~~~ bash
  # Test your web services with curl

  export API_KEY="YOUR-FEDERATION-API-KEY"
  export ORGANIZER_ID="TEST-ORGANIZER-ID"
  export USER_NAME="YOUR-NAME"
  export USER_EMAIL="YOUR-EMAIL"

  curl -H "X-FEDERATION-API-KEY: $API_KEY" -H "X-FEDERATION-ORGANIZER-ID: $ORGANIZER_ID" -H "X-FEDERATION-USER-NAME: $USER_NAME" -H "X-FEDERATION-USER-EMAIL: $USER_EMAIL" -H 'Content-Type: application/json' "http://your-domain.com/test"  
  ~~~
  {: title="Curl" }
---

Make sure that you have specified your **API KEY** under settings for your federation in app.equipe.com and signed in users with *Single Sign On*
{: .info }

Header | Description
--- | :---
X-FEDERATION-API-KEY | Your Federation API-KEY that is configured in Equipe under Federation settings, web services.
X-FEDERATION-ORGANIZER-ID | Your organizer id
X-FEDERATION-USER-NAME | The name of the signed in user in Equipe
X-FEDERATION-USER-EMAIL | The email of the signed in user in Equipe

If the organizer does not have access to a specific end point return `401 Unauthorized`.
{: .error }
