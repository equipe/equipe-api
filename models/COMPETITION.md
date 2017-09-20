## Competition

Attribute | Type | Mandatory | Default | Pattern | Description
--- | :---: | :---: | :---: | --- | ---
id | integer | No |  |  | On importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute
competition_no | string | Yes |  |  | Competition number. Should not be longer then 5-10 characters. Can be a combination of letters and numbers
name | string | Yes |  |  | Name of the competition
alias | boolean | No | true |  | Override generated name of the competition
discipline | string | Yes |  |  | D = Dressage, H = Show Jumping, F = Eventing, A = Breed evaluation, K = Driving, L = List, U = Exhibition, E = Endurance, R = Reining
allow_many | boolean | No | false |  | Only valid for lists (discipline = L) then we don't care about the horse and the lists becomes an extra fee
status | string | No |  |  | K = Club, L = Local, R = Regional, N = National, E = Elite, I = International
starts_on | string | Yes |  | \A\d{4}-\d{2}-\d{2}\z | Start date of the competition, must be the format of YYYY-MM-DD
start_time | string | No |  | \A\d{2}:\d{2}\z | Start time of the competition must be in the format of HH:MM
horse_pony | string | No | "H" |  | Competition open for horses or ponies, R = Horse, P = Pony
team | boolean | No | false |  | If this is a team competition or not
admin_team | boolean | No | false |  | This competition will only contain teams, team members will compete in other non team competitions and their result is counted in this competition. Team must also be set to true
judgement_id | string | No |  |  | The judgement identifier, in Equipe you configure the mapping between the judgement in Equipe with your judgement id. This value needs to be uniq within each discipline. Use descriptive name for easier mapping
fence_height | integer | No |  |  | When discipline is show jumping set fence height in centimeter. This is for presentation
arena | string | No | "" |  | Name of the arena where the competition will be held. Keep consistant naming as the competition will be grouped on this value
admin_fee | number or null | No |  |  | Admin fee (no VAT included by for this fee)
entry_fee | number or null | No |  |  | Entry fee including VAT
starting_fee | number or null | No |  |  | Starting fee including VAT
late_entry_fee | number or null | No |  |  | Late entry fee including VAT
team_entry_fee | number | No | 0 |  | Team entry fee including VAT, the payer for each team will receive this fee
vat_included_by | number | No | 0 |  | VAT included by % on fees
entry_fees | array | No |  |  | Define your own entry fees types for this competition
team_prize_money | array | No |  |  | List of team prize money, the last prize will go to other placings, to give money to fixed number of teams, terminate with 0
prize_money | array | No |  |  | List of prize money, the last prize will go to other placings, to give money to fixed number of starts, terminate with 0
prize_money_currency | string | No |  |  | ISO 4217 formatted currency for prize money
open_for_young_horses | boolean | No | false |  | Competition open for young horses
young_horse_entry_fee | number | No |  |  | Young horses Entry fee including VAT
young_horse_starting_fee | number | No |  |  | Young horses Starting fee including VAT
young_horse_late_entry_fee | number | No |  |  | Young horses Late entry fee including VAT
young_horse_prize_money | array | No |  |  | Young horses list of prize money, the last prize will go to other placings, to give money to fixed number of starts, terminate with 0
honorary_award | boolean | No | false |  | Prize in kind
randomized | boolean | No | false |  | Competition is randomized (this is set automatic by Equipe, override only if you have valid reason for it)
category_merge | string | No | "regulation" |  | How categories should be merged is defined under each Federation, override the value here
club_discount_percent_applied | boolean | No | false |  | Apply club discount for fees on this competition. Club discount is defined under Show
title | string | No |  |  | Header of the competition, in top of print outs
subheader1 | string | No |  |  | Subheader1 of the competition, 2nd header of print outs
subheader2 | string | No |  |  | Subheader2 of the competition, below competition name on print outs

**Example value of entry_fees**
```json
[
  {
    "name":"Stable service",
    "vat":20,
    "amount":320
  }
]

```