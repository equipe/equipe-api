---
title: Show
position: 0.0
description: General settings for the show
right_code: |
  ~~~ json
  {
    "id":1,
    "name":"My Show 2017",
    "currency":"SEK"
  }
  ~~~
  {: title="Example record of Show" }

  ~~~ json
  {
    "person":{
      "favorite_color":{
        "name":"Favorite color",
        "type":"string",
        "align":"left",
        "publish":false
      }
    }
  }
  ~~~
  {: title="Example value of custom_field_names" }

---
**Bold** attributes is required
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
<td>
<strong>id</strong>
<span class="searchable">id</span></td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">On importing entries, this should be your primary key for the show. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute</td>
</tr>
<tr>
<td>
<strong>name</strong>
<span class="searchable">name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">"Untitled"</td>
<td></td>
</tr>
<tr>
<td colspan="5">Name of the show</td>
</tr>
<tr>
<td>
starts_<wbr>on
<span class="searchable">starts_on</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{4}-\d{2}-\d{2}\z</td>
</tr>
<tr>
<td colspan="5">Start date of the show in the format YYYY-MM-DD</td>
</tr>
<tr>
<td>
ends_<wbr>on
<span class="searchable">ends_on</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{4}-\d{2}-\d{2}\z</td>
</tr>
<tr>
<td colspan="5">End date of the show YYYY-MM-DD</td>
</tr>
<tr>
<td>
<strong>currency</strong>
<span class="searchable">currency</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ISO 4217 formmated currency code used for accouting in the show. We will add more currencies when they are needed</td>
</tr>
<tr>
<td>
foreign_<wbr>tax
<span class="searchable">foreign_tax</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Will foreign tax apply or not (When used automatic for people not from foreign_tax_skip)</td>
</tr>
<tr>
<td>
foreign_<wbr>tax_<wbr>percent
<span class="searchable">foreign_tax_percent</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center">15</td>
<td></td>
</tr>
<tr>
<td colspan="5">Foreign tax percent</td>
</tr>
<tr>
<td>
foreign_<wbr>tax_<wbr>skip
<span class="searchable">foreign_tax_skip</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>^[A-Z]{3}$</td>
</tr>
<tr>
<td colspan="5">The IOC code, foreign tax but not for people from this country, this is the country code where the show is located. This defaults to the country of the federation if left out</td>
</tr>
<tr>
<td>
income_<wbr>tax
<span class="searchable">income_tax</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Will income tax apply or not (When used automatic for people from foreign_tax_skip-country without company)</td>
</tr>
<tr>
<td>
income_<wbr>tax_<wbr>percent
<span class="searchable">income_tax_percent</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center">30</td>
<td></td>
</tr>
<tr>
<td colspan="5">Income tax percent</td>
</tr>
<tr>
<td>
always_<wbr>income_<wbr>tax
<span class="searchable">always_income_tax</span></td>
<td style="text-align: center">array</td>
<td style="text-align: center">[]</td>
<td></td>
</tr>
<tr>
<td colspan="5">When income tax is enabled, apply income tax to people from these countries instead of foreign tax. List of IOC codes</td>
</tr>
<tr>
<td>
discount_<wbr>club_<wbr>id
<span class="searchable">discount_club_id</span></td>
<td style="text-align: center">integer or null</td>
<td style="text-align: center">null</td>
<td></td>
</tr>
<tr>
<td colspan="5">Gives discount for riders that competes for the club with this id (See also Competition#club_discount_percent_applied)</td>
</tr>
<tr>
<td>
discount_<wbr>club_<wbr>percent
<span class="searchable">discount_club_percent</span></td>
<td style="text-align: center">number or null</td>
<td style="text-align: center">null</td>
<td></td>
</tr>
<tr>
<td colspan="5">Discount percent for riders that competes for the club (See also Competition#club_discount_percent_applied)</td>
</tr>
<tr>
<td>
penalty_<wbr>fee
<span class="searchable">penalty_fee</span></td>
<td style="text-align: center">number or null</td>
<td style="text-align: center">null</td>
<td></td>
</tr>
<tr>
<td colspan="5">Penalty fee for starts marked with status no-show</td>
</tr>
<tr>
<td>
credit_<wbr>card_<wbr>fee_<wbr>percents
<span class="searchable">credit_card_fee_percents</span></td>
<td style="text-align: center">array</td>
<td style="text-align: center">[]</td>
<td></td>
</tr>
<tr>
<td colspan="5">Possibllty to add credit card fee % on invoices</td>
</tr>
<tr>
<td>
accounts
<span class="searchable">accounts</span></td>
<td style="text-align: center">array</td>
<td style="text-align: center">["tdb", "bank", "prepaid", "cash", "credit_card", "swish"]</td>
<td></td>
</tr>
<tr>
<td colspan="5">List of payment accounts</td>
</tr>
<tr>
<td>
default_<wbr>account
<span class="searchable">default_account</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">"cash"</td>
<td></td>
</tr>
<tr>
<td colspan="5">Default account must also exist in accounts</td>
</tr>
<tr>
<td>
prize_<wbr>money_<wbr>equal_<wbr>ranked
<span class="searchable">prize_money_equal_ranked</span></td>
<td style="text-align: center">integer</td>
<td style="text-align: center">2</td>
<td></td>
</tr>
<tr>
<td colspan="5">1 = Highest prize money, 2 = Prize money splits</td>
</tr>
<tr>
<td>
withdrawn_<wbr>pay
<span class="searchable">withdrawn_pay</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">true</td>
<td></td>
</tr>
<tr>
<td colspan="5">Will withdrawn starts pay the entry fee or not, when false the entry fee behave like a start fee</td>
</tr>
<tr>
<td>
minimum_<wbr>entry_<wbr>fee_<wbr>in_<wbr>prize_<wbr>money
<span class="searchable">minimum_entry_fee_in_prize_money</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">When enabled it never give less the entry fee in prize money for placed starts</td>
</tr>
<tr>
<td>
result_<wbr>name
<span class="searchable">result_name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Name of the person responsibly for the results</td>
</tr>
<tr>
<td>
result_<wbr>email
<span class="searchable">result_email</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Email of the person responsibly for the results</td>
</tr>
<tr>
<td>
result_<wbr>cell_<wbr>phone
<span class="searchable">result_cell_phone</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Cell phone of the person responsibly for the results</td>
</tr>
<tr>
<td>
publish_<wbr>horse_<wbr>labels
<span class="searchable">publish_horse_labels</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Publish horse labels to online.equipe.com</td>
</tr>
<tr>
<td>
publish_<wbr>prize_<wbr>money
<span class="searchable">publish_prize_money</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">true</td>
<td></td>
</tr>
<tr>
<td colspan="5">Publish prize money to online.equipe.com</td>
</tr>
<tr>
<td>
publish_<wbr>horse_<wbr>no
<span class="searchable">publish_horse_no</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">true</td>
<td></td>
</tr>
<tr>
<td colspan="5">Publish horse no to online.equipe.com</td>
</tr>
<tr>
<td>
custom_<wbr>field_<wbr>names
<span class="searchable">custom_field_names</span></td>
<td style="text-align: center">object</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Object where key is person, horse or start. See [Custom field](CUSTOM_FIELD.md)</td>
</tr>
</tbody>
</table>
