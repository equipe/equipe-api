---
title: Single Sign On
position: 1.1
description: This is the first step for a complete integration.
right_code: |
  ~~~ html
  <form action="your-single-sign-on-url" method="post">
    <input type="hidden" name="organizer_id" value="your id of the organizer">
    <input type="hidden" name="organizer_name" value="name of the organizer">
    <input type="hidden" name="name" value="name of the user">
    <input type="hidden" name="email" value="email of the user">
    <input type="hidden" name="cell_phone" value="cell phone number of the user">
    <input type="hidden" name="locale" value="Language for the user">
    <input type="hidden" name="auth_token" value="your generated token">
    <input type="submit" value="Submit">
  </form>
  ~~~
  {: title="Form" }
---
Make sure that you have specified your **API KEY**, enabled **Single sign on** and copied your unique `YOUR-SINGLE-SIGN-ON-URL` under settings for your federation in app.equipe.com.
{: .info }

Users of your system needs to login to `https://app.equipe.com`, you can sign in users that you already have authenticated. This also creates the organizer and user if they do not already exist in Equipe and assigns them to your federation. You should only generate this login possibility to users that have the role of organizer.

### HTML Form

Generate a form with the following hidden fields.

Name | Description
--- | ---
organizer_id | Your id of the organizer
organizer_name | Name of the organizer
name | Name of the user
email | Email of the user
cell_phone | Cell phone number of the user
locale | Language for the user
auth_token | Your generated token

Supported locales is sv, en, es, nl, fi, fr and da

### Generate auth token

Concat the values of organizer_id, organizer_name, name, email, cell_phone and your `api key`. Make a `SHA256` hexdigest of the result. We will use this to verify that your are the sender of the information and that it is untouched. Your federation `api_key` serves as the shared secret.

#### Example

```ruby
federation_api_key = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
organizer_id = 235
organizer_name = 'Helsingborg FRK'
name = 'Kim Fors'
email = 'kim.fors@example.com'
cell_phone = '+4670123123'
locale = 'en'
auth_token = Digest::SHA256.hexdigest([organizer_id, organizer_name, name, email, cell_phone, locale, federation_api_key].join)
```

The **auth_token** is `f9164f2b22f4627aa14cd411e9af4f2b67953eafb64010347bc05a26269f1305` for the given values above.
{: .success }
