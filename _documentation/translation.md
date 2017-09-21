---
title: Translation
position: 2
description: Translation of app.equipe.com
---
Translation should be done and maintained by a active user of the system.
{: .info }


<img src="images/start_reason.png?raw=true" alt="Image of Federation webservices" style="width: 100%"/>

You will notice that more words will come over and over again. This is because they are used in different parts of the apps. The translation-key is visible in the top-right of the word, it will give you some context where it's used. Marked with yellow in the screenshot above.

Translation.io saves white space and new line, so be careful when you leave the text box so there is no extra new line (enter) or traling white space.
{: .warning }


Try to keep the words in similar length as the original values.

```yaml
# The translation of these keys must be as short as in English as it's used on on report headers with very limited space.
en:
  reports:
    label_overrides:
      starts:
        st: St.No
        running_number: St.No
        re: Rk
        horse_no: H.No
        tid: Time
        tidd: CC. Time
        rider_country: Nat

es:        
  reports:
    label_overrides:
      starts:
        st: O.S.
        running_number: O.S.
        re: Cl
        horse_no: NºC.
        tid: Tiempo
        tidd: CC. Tiempo
        rider_country: Nac
sv:
  reports:
    label_overrides:
      starts:
        st: St.Nr
        running_number: St.Nr
        re: Pl
        horse_no: H.Nr
        tid: Tid
        tidd: Uth. Tid
        rider_country: Nat

# The translation of these keys must be as short as in English as it's used on the scoreboards with very limited space.
en:
  scoreboard:
    components:
      participants: Total
      remaining: Left
      end_time: Finish
      rank: Rank
```

#### Important to get it right

This is importent values to translate correctly.
{: .error }

```yaml
en:
  meetings:
    navbar:                     # Look at other windows or mac software, these words is often used in menu items. Keep the same that is normally used in your language.
      file: File
      edit: Edit
      go_to: Go to
      tools: Tools
      actions: Actions
      economy: Economy      

en:
  activerecord:
    values:
      start:
        status:
          Ö: Withdrawn            # Withdrawn (configured under show settings, if they have to pay or not)
          ö: Withdrawn by judge   # Withdrawn
          E: Unpaid withdrawn     # Like withdrawn but communicate that the reason is because missing payment
          U: No-show              # Like withdrawn but possibility to add penatly fee (configured under show settings)
          u: No-show by judge     # Same as above but done from the judge tower
          B: Changed competition  # Like withdrawn, but the payer will not be charged for this start
          R: Reserve              # Will not be in the start lists, moved to a queue
          S: Starting notified    # Have told the show office that they are going to start, not used often
        status_short:             # See status above
          Ö: Withdrawn
          ö: withdrawn
          E: Unpaid
          U: No-show
          u: no-show
          B: Changed
          R: Reserve
          S: Starting
        or:                       # See reason below
          A: Abst.
          U: Ret.
          D: Eli.
          S: DQ
        reason:                    # All of these is a result, they will be calculated as starting
          A: Abstained             # This is the easiest to get wrong, Abstained is only used if the start is qualified for jump off, but does not want to participate, this is a result like eliminated or retired.
          U: Retired
          D: Eliminated           
          S: Disqualified          # Often done afterwards, when the competition is finished. Judges take this decision.
```

#### What is it?

* TDB - System for the Swedish federation, should not be translated to something else, this is not visible outside Sweden.
* Swish - Electronic payment person to person. If something similar exist it can be translated


#### Contact

Contact us if you are want to translate app.equipe.com to your language. You should know our system well before you start making the translation.