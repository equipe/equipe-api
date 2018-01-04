---
title: Competition
position: 1.0
right_code: |
  ~~~ json
  [
    {
      "name":"Stable service",
      "vat":20,
      "amount":320
    }
  ]
  ~~~
  {: title="Example value of entry_fees" }
  
---
Attributes in **Bold** is required
{: .info }
<table>
<thead>
<th>Attribute</th>
<th style="text-align: center">Type</th>
<th style="text-align: center">Default</th>
<th style="text-align: center">Pattern</th>
</thead>
<tbody>
<tr>
<td id="competition_id">
id
<span class="searchable">id</span></td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">On importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute</td>
</tr>
<tr>
<td id="competition_competition_no">
<strong>competition_<wbr>no</strong>
<span class="searchable">competition_no</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition number. Should not be longer then 5-10 characters. Can be a combination of letters and numbers</td>
</tr>
<tr>
<td id="competition_name">
<strong>name</strong>
<span class="searchable">name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Name of the competition</td>
</tr>
<tr>
<td id="competition_alias">
alias
<span class="searchable">alias</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">true</td>
<td></td>
</tr>
<tr>
<td colspan="5">Override generated name of the competition</td>
</tr>
<tr>
<td id="competition_discipline">
<strong>discipline</strong>
<span class="searchable">discipline</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">D = Dressage, H = Show Jumping, F = Eventing, A = Breed evaluation, K = Driving, L = List, U = Exhibition, E = Endurance, R = Reining</td>
</tr>
<tr>
<td id="competition_allow_many">
allow_<wbr>many
<span class="searchable">allow_many</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Only valid for lists (discipline = L) then we don't care about the horse and the lists becomes an extra fee</td>
</tr>
<tr>
<td id="competition_status">
status
<span class="searchable">status</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">K = Club, L = Local, R = Regional, N = National, E = Elite, I = International</td>
</tr>
<tr>
<td id="competition_starts_on">
<strong>starts_<wbr>on</strong>
<span class="searchable">starts_on</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{4}-\d{2}-\d{2}\z</td>
</tr>
<tr>
<td colspan="5">Start date of the competition, must be the format of YYYY-MM-DD</td>
</tr>
<tr>
<td id="competition_start_time">
start_<wbr>time
<span class="searchable">start_time</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{2}:\d{2}\z</td>
</tr>
<tr>
<td colspan="5">Start time of the competition must be in the format of HH:MM</td>
</tr>
<tr>
<td id="competition_dressage_lock_start_times">
dressage_<wbr>lock_<wbr>start_<wbr>times
<span class="searchable">dressage_lock_start_times</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Lock start times so they are not updated automatic</td>
</tr>
<tr>
<td id="competition_horse_pony">
horse_<wbr>pony
<span class="searchable">horse_pony</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">"R"</td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition open for horses or ponies, R = Horse, P = Pony</td>
</tr>
<tr>
<td id="competition_team">
team
<span class="searchable">team</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">If this is a team competition or not</td>
</tr>
<tr>
<td id="competition_admin_team">
admin_<wbr>team
<span class="searchable">admin_team</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">This competition will only contain teams, team members will compete in other non team competitions and their result is counted in this competition. Team must also be set to true</td>
</tr>
<tr>
<td id="competition_judgement_id">
judgement_<wbr>id
<span class="searchable">judgement_id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">The judgement identifier, in Equipe you configure the mapping between the judgement in Equipe with your judgement id. This value needs to be uniq within each discipline. Use descriptive name for easier mapping</td>
</tr>
<tr>
<td id="competition_fence_height">
fence_<wbr>height
<span class="searchable">fence_height</span></td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">When discipline is show jumping set fence height in centimeter. This is for presentation</td>
</tr>
<tr>
<td id="competition_arena">
arena
<span class="searchable">arena</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Name of the arena where the competition will be held. Keep consistant naming as the competition will be grouped on this value</td>
</tr>
<tr>
<td id="competition_admin_fee">
admin_<wbr>fee
<span class="searchable">admin_fee</span></td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Admin fee (no VAT included by for this fee)</td>
</tr>
<tr>
<td id="competition_entry_fee">
entry_<wbr>fee
<span class="searchable">entry_fee</span></td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Entry fee including VAT</td>
</tr>
<tr>
<td id="competition_starting_fee">
starting_<wbr>fee
<span class="searchable">starting_fee</span></td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Starting fee including VAT</td>
</tr>
<tr>
<td id="competition_late_entry_fee">
late_<wbr>entry_<wbr>fee
<span class="searchable">late_entry_fee</span></td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Late entry fee including VAT</td>
</tr>
<tr>
<td id="competition_team_entry_fee">
team_<wbr>entry_<wbr>fee
<span class="searchable">team_entry_fee</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center">0</td>
<td></td>
</tr>
<tr>
<td colspan="5">Team entry fee including VAT, the payer for each team will receive this fee</td>
</tr>
<tr>
<td id="competition_vat_included_by">
vat_<wbr>included_<wbr>by
<span class="searchable">vat_included_by</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center">0</td>
<td></td>
</tr>
<tr>
<td colspan="5">VAT included by % on fees</td>
</tr>
<tr>
<td id="competition_entry_fees">
entry_<wbr>fees
<span class="searchable">entry_fees</span></td>
<td style="text-align: center">array</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Define your own entry fees types for this competition</td>
</tr>
<tr>
<td id="competition_team_prize_money">
team_<wbr>prize_<wbr>money
<span class="searchable">team_prize_money</span></td>
<td style="text-align: center">array</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">List of team prize money, the last prize will go to other placings, to give money to fixed number of teams, terminate with 0</td>
</tr>
<tr>
<td id="competition_prize_money">
prize_<wbr>money
<span class="searchable">prize_money</span></td>
<td style="text-align: center">array</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">List of prize money, the last prize will go to other placings, to give money to fixed number of starts, terminate with 0</td>
</tr>
<tr>
<td id="competition_prize_money_currency">
prize_<wbr>money_<wbr>currency
<span class="searchable">prize_money_currency</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ISO 4217 formatted currency for prize money</td>
</tr>
<tr>
<td id="competition_open_for_young_horses">
open_<wbr>for_<wbr>young_<wbr>horses
<span class="searchable">open_for_young_horses</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition open for young horses</td>
</tr>
<tr>
<td id="competition_young_horse_entry_fee">
young_<wbr>horse_<wbr>entry_<wbr>fee
<span class="searchable">young_horse_entry_fee</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Young horses Entry fee including VAT</td>
</tr>
<tr>
<td id="competition_young_horse_starting_fee">
young_<wbr>horse_<wbr>starting_<wbr>fee
<span class="searchable">young_horse_starting_fee</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Young horses Starting fee including VAT</td>
</tr>
<tr>
<td id="competition_young_horse_late_entry_fee">
young_<wbr>horse_<wbr>late_<wbr>entry_<wbr>fee
<span class="searchable">young_horse_late_entry_fee</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Young horses Late entry fee including VAT</td>
</tr>
<tr>
<td id="competition_young_horse_prize_money">
young_<wbr>horse_<wbr>prize_<wbr>money
<span class="searchable">young_horse_prize_money</span></td>
<td style="text-align: center">array</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Young horses list of prize money, the last prize will go to other placings, to give money to fixed number of starts, terminate with 0</td>
</tr>
<tr>
<td id="competition_honorary_award">
honorary_<wbr>award
<span class="searchable">honorary_award</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Prize in kind</td>
</tr>
<tr>
<td id="competition_randomized">
randomized
<span class="searchable">randomized</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition is randomized (this is set automatic by Equipe, override only if you have valid reason for it)</td>
</tr>
<tr>
<td id="competition_category_merge">
category_<wbr>merge
<span class="searchable">category_merge</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">"regulation"</td>
<td></td>
</tr>
<tr>
<td colspan="5">How categories should be merged is defined under each Federation, override the value here</td>
</tr>
<tr>
<td id="competition_club_discount_percent_applied">
club_<wbr>discount_<wbr>percent_<wbr>applied
<span class="searchable">club_discount_percent_applied</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Apply club discount for fees on this competition. Club discount is defined under Show</td>
</tr>
<tr>
<td id="competition_reduce_prize_money_when_fewer_than">
reduce_<wbr>prize_<wbr>money_<wbr>when_<wbr>fewer_<wbr>than
<span class="searchable">reduce_prize_money_when_fewer_than</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center">null</td>
<td></td>
</tr>
<tr>
<td colspan="5">When fewer starts than the given value, the prize will be reduced with reduce_prize_money_when_fewer_than_percent</td>
</tr>
<tr>
<td id="competition_reduce_prize_money_when_fewer_than_percent">
reduce_<wbr>prize_<wbr>money_<wbr>when_<wbr>fewer_<wbr>than_<wbr>percent
<span class="searchable">reduce_prize_money_when_fewer_than_percent</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center">50</td>
<td></td>
</tr>
<tr>
<td colspan="5">The percent to reduce the prize money with when lower then X number of starts in the competition</td>
</tr>
<tr>
<td id="competition_title">
title
<span class="searchable">title</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Header of the competition, in top of print outs</td>
</tr>
<tr>
<td id="competition_subheader1">
subheader1
<span class="searchable">subheader1</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Subheader1 of the competition, 2nd header of print outs</td>
</tr>
<tr>
<td id="competition_subheader2">
subheader2
<span class="searchable">subheader2</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Subheader2 of the competition, below competition name on print outs</td>
</tr>
</tbody>
</table>