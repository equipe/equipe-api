---
title: Person
position: 2.0
right_code: |
  ~~~ json
  {
    "favorite_color":"green"
  }
  ~~~
  {: title="Example value of custom_fields" }
  
  ~~~ json
  {
    "prepaid":{
      "amount":250,
      "description":"Receipt number 123",
      "created_at":"2017-05-06"
    }
  }
  ~~~
  {: title="Example value of payments" }
  
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
<td colspan="5">On importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute</td>
</tr>
<tr>
<td>
first_<wbr>name
<span class="searchable">first_name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td>
<strong>last_<wbr>name</strong>
<span class="searchable">last_name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td>
address
<span class="searchable">address</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td>
zipcode
<span class="searchable">zipcode</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td>
city
<span class="searchable">city</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td>
address_<wbr>country
<span class="searchable">address_country</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Full name of the country</td>
</tr>
<tr>
<td>
country
<span class="searchable">country</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td>^[A-Z]{3}$</td>
</tr>
<tr>
<td colspan="5">The IOC code of the country the rider is competing for</td>
</tr>
<tr>
<td>
work_<wbr>phone
<span class="searchable">work_phone</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
home_<wbr>phone
<span class="searchable">home_phone</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
cell_<wbr>phone
<span class="searchable">cell_phone</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
email
<span class="searchable">email</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
licence
<span class="searchable">licence</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
licence_<wbr>year
<span class="searchable">licence_year</span></td>
<td style="text-align: center">string or integer or null</td>
<td style="text-align: center"></td>
<td>\A\d{4}\z</td>
</tr>
<tr>
<td colspan="5">The year licence is valid. 4 digits</td>
</tr>
<tr>
<td>
club_<wbr>id
<span class="searchable">club_id</span></td>
<td style="text-align: center">integer or null</td>
<td style="text-align: center">null</td>
<td></td>
</tr>
<tr>
<td colspan="5">The club with this ID should be in the clubs-resource</td>
</tr>
<tr>
<td>
fei_<wbr>id
<span class="searchable">fei_id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">FEI ID for the person</td>
</tr>
<tr>
<td>
national_<wbr>id
<span class="searchable">national_id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
passport_<wbr>no
<span class="searchable">passport_no</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
person_<wbr>no
<span class="searchable">person_no</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{4}(-\d{2}-\d{2})?\z</td>
</tr>
<tr>
<td colspan="5">Either ISO 8601 formatted birth date, or only year of birth</td>
</tr>
<tr>
<td>
company
<span class="searchable">company</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">If the person is represented by a company, this name will be shown on the invoice</td>
</tr>
<tr>
<td>
vat_<wbr>no
<span class="searchable">vat_no</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">VAT number for the company</td>
</tr>
<tr>
<td>
foreign_<wbr>tax
<span class="searchable">foreign_tax</span></td>
<td style="text-align: center">boolean or null</td>
<td style="text-align: center">null</td>
<td></td>
</tr>
<tr>
<td colspan="5">Apply foreign tax leave as null to make the system auto calculate this</td>
</tr>
<tr>
<td>
account_<wbr>number
<span class="searchable">account_number</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
account_<wbr>holder
<span class="searchable">account_holder</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
bank_<wbr>name
<span class="searchable">bank_name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
iban
<span class="searchable">iban</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
bic
<span class="searchable">bic</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
invoice_<wbr>no
<span class="searchable">invoice_no</span></td>
<td style="text-align: center">integer or null</td>
<td style="text-align: center">null</td>
<td></td>
</tr>
<tr>
<td colspan="5">Invoice number generated by the system on print out</td>
</tr>
<tr>
<td>
income_<wbr>tax_<wbr>percent
<span class="searchable">income_tax_percent</span></td>
<td style="text-align: center">number or null</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Override the normal income tax percent defined in show settings for this person</td>
</tr>
<tr>
<td>
do_<wbr>not_<wbr>charge_<wbr>vat
<span class="searchable">do_not_charge_vat</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">When true, VAT for all fees with respect_do_not_charge_vat set to true will excluded</td>
</tr>
<tr>
<td>
official
<span class="searchable">official</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Flag this person as an official, with this flag is true, the person can be selected as ground jury or dressage judge</td>
</tr>
<tr>
<td>
arrived
<span class="searchable">arrived</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">Flag to set if the person has arrived on the show</td>
</tr>
<tr>
<td>
notes
<span class="searchable">notes</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
custom_<wbr>fields
<span class="searchable">custom_fields</span></td>
<td style="text-align: center">object</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">The object key refers to the key in [custom_field_names](SHOW.md) on show</td>
</tr>
<tr>
<td>
payments
<span class="searchable">payments</span></td>
<td style="text-align: center">object</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">The object key refers to the account name, it must be included the [accounts](SHOW.md) on show. See [Payment](PAYMENT.md) Payments is not available on search riders and search officials.</td>
</tr>
</tbody>
</table>