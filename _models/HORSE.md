---
title: Horse
position: 3.0
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
<strong>name</strong>
<span class="searchable">name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td>
horse_<wbr>no
<span class="searchable">horse_no</span></td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Unless horse no is given, all newly imported horses will be sorted by name and given a number automatic, that is preferable</td>
</tr>
<tr>
<td>
born_<wbr>year
<span class="searchable">born_year</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{4}\z</td>
</tr>
<tr>
<td colspan="5">4-digits birth year</td>
</tr>
<tr>
<td>
sex
<span class="searchable">sex</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">"unknown"</td>
<td></td>
</tr>
<tr>
<td colspan="5">S = Stallion, G = Gelding, M = Mare, unknown = Unknown</td>
</tr>
<tr>
<td>
category
<span class="searchable">category</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">"H"</td>
<td></td>
</tr>
<tr>
<td colspan="5">H = Horse, A, B, C, D, E, 1, 2 or 3</td>
</tr>
<tr>
<td>
licence
<span class="searchable">licence</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">National licence</td>
</tr>
<tr>
<td>
licence_<wbr>year
<span class="searchable">licence_year</span></td>
<td style="text-align: center">string or integer</td>
<td style="text-align: center"></td>
<td>\A\d{4}\z</td>
</tr>
<tr>
<td colspan="5">The year licence is valid. 4 digits</td>
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
<td>
country
<span class="searchable">country</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td>^[A-Z]{3}$</td>
</tr>
<tr>
<td colspan="5">The IOC code for the country in which the horse was born</td>
</tr>
<tr>
<td>
color
<span class="searchable">color</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
breed
<span class="searchable">breed</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Stud book of the horse in short, e.g. SWB or HANN</td>
</tr>
<tr>
<td>
race
<span class="searchable">race</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
height
<span class="searchable">height</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
reg_<wbr>no
<span class="searchable">reg_no</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Registration number of the horse</td>
</tr>
<tr>
<td>
breeder
<span class="searchable">breeder</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Breeder of the horse</td>
</tr>
<tr>
<td>
owner
<span class="searchable">owner</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Current owner of the horse</td>
</tr>
<tr>
<td>
sire
<span class="searchable">sire</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
dam
<span class="searchable">dam</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
dams_<wbr>dam
<span class="searchable">dams_dam</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
dam_<wbr>sire
<span class="searchable">dam_sire</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>
dams_<wbr>damsire
<span class="searchable">dams_damsire</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
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
</tbody>
</table>