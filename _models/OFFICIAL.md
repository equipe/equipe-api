---
title: Official
position: 11.0
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
<td id="_id">
<strong>id</strong>
<span class="searchable">id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">On importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute.</td>
</tr>
<tr>
<td id="_first_name">
first_<wbr>name
<span class="searchable">first_name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td id="_last_name">
<strong>last_<wbr>name</strong>
<span class="searchable">last_name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td id="_address">
address
<span class="searchable">address</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td id="_zipcode">
zipcode
<span class="searchable">zipcode</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td id="_city">
city
<span class="searchable">city</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td id="_address_country">
address_<wbr>country
<span class="searchable">address_country</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_country">
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
<td id="_work_phone">
work_<wbr>phone
<span class="searchable">work_phone</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_home_phone">
home_<wbr>phone
<span class="searchable">home_phone</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_cell_phone">
cell_<wbr>phone
<span class="searchable">cell_phone</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_email">
email
<span class="searchable">email</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_licence">
licence
<span class="searchable">licence</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_licence_year">
licence_<wbr>year
<span class="searchable">licence_year</span></td>
<td style="text-align: center">string or integer or null</td>
<td style="text-align: center"></td>
<td>\A\d{4}\z</td>
</tr>
<tr>
<td id="_club_id">
club_<wbr>id
<span class="searchable">club_id</span></td>
<td style="text-align: center">string or null</td>
<td style="text-align: center">null</td>
<td></td>
</tr>
<tr>
<td colspan="5">Your primary key of the club</td>
</tr>
<tr>
<td id="_club_logo_id">
club_<wbr>logo_<wbr>id
<span class="searchable">club_logo_id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Refers to our central repository for logos which are shared between all our systems. When logo_id is a number and less then 4 digits, prefix it with zero. Example 54 should be 0054</td>
</tr>
<tr>
<td id="_club_logo_group">
club_<wbr>logo_<wbr>group
<span class="searchable">club_logo_group</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td id="_fei_id">
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
<td id="_national_id">
national_<wbr>id
<span class="searchable">national_id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_passport_no">
passport_<wbr>no
<span class="searchable">passport_no</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_person_no">
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
<td id="_company">
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
<td id="_vat_no">
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
<td id="_foreign_tax">
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
<td id="_account_number">
account_<wbr>number
<span class="searchable">account_number</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_account_holder">
account_<wbr>holder
<span class="searchable">account_holder</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_bank_name">
bank_<wbr>name
<span class="searchable">bank_name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_iban">
iban
<span class="searchable">iban</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_bic">
bic
<span class="searchable">bic</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td id="_invoice_no">
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
<td id="_income_tax_percent">
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
<td id="_do_not_charge_vat">
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
<td id="_official">
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
<td id="_arrived">
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
<td id="_notes">
notes
<span class="searchable">notes</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
</tbody>
</table>