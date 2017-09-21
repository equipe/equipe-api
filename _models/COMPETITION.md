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
<table>
<thead>
<th>Attribute</th>
<th style="text-align: center">Type</th>
<th style="text-align: center">Default</th>
<th style="text-align: center">Pattern</th>
</thead>
<tbody>
<tr>
<td>id</td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">On importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute</td>
</tr>
<tr>
<td><strong>competition_<wbr>no</strong></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition number. Should not be longer then 5-10 characters. Can be a combination of letters and numbers</td>
</tr>
<tr>
<td><strong>name</strong></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Name of the competition</td>
</tr>
<tr>
<td>alias</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">true</td>
<td></td>
</tr>
<tr>
<td colspan="5">Override generated name of the competition</td>
</tr>
<tr>
<td><strong>discipline</strong></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">D = Dressage, H = Show Jumping, F = Eventing, A = Breed evaluation, K = Driving, L = List, U = Exhibition, E = Endurance, R = Reining</td>
</tr>
<tr>
<td>allow_<wbr>many</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Only valid for lists (discipline = L) then we don't care about the horse and the lists becomes an extra fee</td>
</tr>
<tr>
<td>status</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">K = Club, L = Local, R = Regional, N = National, E = Elite, I = International</td>
</tr>
<tr>
<td><strong>starts_<wbr>on</strong></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{4}-\d{2}-\d{2}\z</td>
</tr>
<tr>
<td colspan="5">Start date of the competition, must be the format of YYYY-MM-DD</td>
</tr>
<tr>
<td>start_<wbr>time</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{2}:\d{2}\z</td>
</tr>
<tr>
<td colspan="5">Start time of the competition must be in the format of HH:MM</td>
</tr>
<tr>
<td>horse_<wbr>pony</td>
<td style="text-align: center">string</td>
<td style="text-align: center">"H"</td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition open for horses or ponies, R = Horse, P = Pony</td>
</tr>
<tr>
<td>team</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">If this is a team competition or not</td>
</tr>
<tr>
<td>admin_<wbr>team</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">This competition will only contain teams, team members will compete in other non team competitions and their result is counted in this competition. Team must also be set to true</td>
</tr>
<tr>
<td>judgement_<wbr>id</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">The judgement identifier, in Equipe you configure the mapping between the judgement in Equipe with your judgement id. This value needs to be uniq within each discipline. Use descriptive name for easier mapping</td>
</tr>
<tr>
<td>fence_<wbr>height</td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">When discipline is show jumping set fence height in centimeter. This is for presentation</td>
</tr>
<tr>
<td>arena</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Name of the arena where the competition will be held. Keep consistant naming as the competition will be grouped on this value</td>
</tr>
<tr>
<td>admin_<wbr>fee</td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Admin fee (no VAT included by for this fee)</td>
</tr>
<tr>
<td>entry_<wbr>fee</td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Entry fee including VAT</td>
</tr>
<tr>
<td>starting_<wbr>fee</td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Starting fee including VAT</td>
</tr>
<tr>
<td>late_<wbr>entry_<wbr>fee</td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Late entry fee including VAT</td>
</tr>
<tr>
<td>team_<wbr>entry_<wbr>fee</td>
<td style="text-align: center">number</td>
<td style="text-align: center">0</td>
<td></td>
</tr>
<tr>
<td colspan="5">Team entry fee including VAT, the payer for each team will receive this fee</td>
</tr>
<tr>
<td>vat_<wbr>included_<wbr>by</td>
<td style="text-align: center">number</td>
<td style="text-align: center">0</td>
<td></td>
</tr>
<tr>
<td colspan="5">VAT included by % on fees</td>
</tr>
<tr>
<td>entry_<wbr>fees</td>
<td style="text-align: center">array</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Define your own entry fees types for this competition</td>
</tr>
<tr>
<td>team_<wbr>prize_<wbr>money</td>
<td style="text-align: center">array</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">List of team prize money, the last prize will go to other placings, to give money to fixed number of teams, terminate with 0</td>
</tr>
<tr>
<td>prize_<wbr>money</td>
<td style="text-align: center">array</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">List of prize money, the last prize will go to other placings, to give money to fixed number of starts, terminate with 0</td>
</tr>
<tr>
<td>prize_<wbr>money_<wbr>currency</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ISO 4217 formatted currency for prize money</td>
</tr>
<tr>
<td>open_<wbr>for_<wbr>young_<wbr>horses</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition open for young horses</td>
</tr>
<tr>
<td>young_<wbr>horse_<wbr>entry_<wbr>fee</td>
<td style="text-align: center">number</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Young horses Entry fee including VAT</td>
</tr>
<tr>
<td>young_<wbr>horse_<wbr>starting_<wbr>fee</td>
<td style="text-align: center">number</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Young horses Starting fee including VAT</td>
</tr>
<tr>
<td>young_<wbr>horse_<wbr>late_<wbr>entry_<wbr>fee</td>
<td style="text-align: center">number</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Young horses Late entry fee including VAT</td>
</tr>
<tr>
<td>young_<wbr>horse_<wbr>prize_<wbr>money</td>
<td style="text-align: center">array</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Young horses list of prize money, the last prize will go to other placings, to give money to fixed number of starts, terminate with 0</td>
</tr>
<tr>
<td>honorary_<wbr>award</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Prize in kind</td>
</tr>
<tr>
<td>randomized</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition is randomized (this is set automatic by Equipe, override only if you have valid reason for it)</td>
</tr>
<tr>
<td>category_<wbr>merge</td>
<td style="text-align: center">string</td>
<td style="text-align: center">"regulation"</td>
<td></td>
</tr>
<tr>
<td colspan="5">How categories should be merged is defined under each Federation, override the value here</td>
</tr>
<tr>
<td>club_<wbr>discount_<wbr>percent_<wbr>applied</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Apply club discount for fees on this competition. Club discount is defined under Show</td>
</tr>
<tr>
<td>title</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Header of the competition, in top of print outs</td>
</tr>
<tr>
<td>subheader1</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Subheader1 of the competition, 2nd header of print outs</td>
</tr>
<tr>
<td>subheader2</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Subheader2 of the competition, below competition name on print outs</td>
</tr>
</tbody>
</table>