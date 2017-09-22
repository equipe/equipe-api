---
title: Guide
description: Recommended steps to make a complete integration
position: 1.0
---
These steps will guide you on how to make seamless integration between your federation and Equipe. The prerequisites is that you already have an entry system where organizers and riders can login to mange entries.

#### Step 1 - Sign in user

This solves two problems, create the organizer and user in Equipe, and make it single sign on from your federation system. The user only needs to authenticate once. [Read more](#federation_apisingle_sign_on)

#### Step 2 - Import entries to Equipe

First of all we need to be able to import entries into Equipe. This is done by specifying the **Shows URL** in the settings for your federation in Equipe.

<img src="images/federation_webservices.png?raw=true" alt="Image of Federation webservices" style="width: 100%"/>

* User creates a new show in Equipe, and selects File > Federation > Import entries.
* Equipe makes a `HTTP GET` with [headers](#federation_apiauthentication) to the **Shows URL** it return shows that the logged in user are able to import.
* Equipe will ask the user to select a show to import.
* Equipe will follow the `entries_url` with [headers](#federation_apiauthentication) in the response from `shows_url` and begin importing entries.

This is a smart import, so the user can run this multiple times to fetch the lates changes. Updates in the show made in Equipe will not be overridden by the import. This is due to our tracking history.

[Read more about the entry file format](#federation_apientries)

#### Step 3 - Create judgement mapping

We have support for over 50+ show jumping judgements. There is a big chance that we already have support for your judgement, if not we are happy to add it. When the import runs it will track all `judgement_id` (this is the judgement identitifer, string value, unique to each discipline) that is not currently mapped to a judgement in Equipe. Go to your federation settings, under Judgements, and fill in the missing details. Some Federations have a loose definition of the rule, so the organizer can decide later on. Mapp it to the most common one.

For disciplines that are using Marking sheets (Dressage, Freestyle, Show jumping classes for young horses, Eventing), we need to full tests in order for Equipe to function properly, this also allow the user to print the tests from our system with the name of the rider, horse and judge.

You have read-only access to all FEI tests, these can be copied to your federation and translated to your language, and your custom ones needs to be created. We have a editor to create these under your Federation settings.

The big advantage of doing the mapping in Equipe, is that your system never needs to know about any of our internals, we commmunicate with a judgement_identitifer keep it as a string to make the mapping work simpler. These works 2-way, when we later export the results you will get your identifier back.

#### Step 4 - Build search webservices

Normally we get all entries before hand. But often there will be changes during the show and at that time your system is closed for new entries.

To make sure you get the correct information back in the results, implement the following web services in your system which allows the user to bring in new people, horses and clubs to the show.

  * [Search riders](#federation_apisearch_riders)
  * [Search officials](#federation_apisearch_officials)
  * [Search horses](#federation_apisearch_horses)
  * [Search clubs](#federation_apisearch_clubs)

This way you have the control to only return valid riders and horses, who have paid their licences.

#### Step 5 - Receive submitted results

When the show is finished, the user will submit results upstream to your system. It can also be done per competition.

* User select File > Federation > Export results
* By default all competitions are selected
* Equipe builds the result json payload and makes a `HTTP POST` to your system.
* You run your own validation and return `202 Accepted` for success or `422 Unprocessable entity` with a json response that contains the validation error for failure.
* User gets your feedback

[Read more](#federation_apiresults)

#### Step 6 - Translation

We have support for translation of both app.equipe.com and online.equipe.com (Live-result service). The first step is to translate online.equipe.com as since this is for riders and audience. When you have users that have run serveral shows in Equipe, the main app should also be translated. [Read more](#moretranslation)

#### Conclusion

We know by experiance that it can take some time to get all the above steps right. But it's well worth the effort. Equipe is the perfect addition to your entry system. We give extraordinary user experience to run a equestiran show. We have all features necessary to run a show on any level, from the smallest national show to the biggest 5* show.

The web services above is the key, that will give a true seamless experience for the user, to import competitions and entries, run the show and export the results without having to download and upload files manually.

We are ready to assist with your integration and explain in more detail and validate your json responses.
