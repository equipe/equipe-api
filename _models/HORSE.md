---
title: Horse
position: 3.0
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
<td><strong>id</strong></td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">On importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute</td>
</tr>
<tr>
<td><strong>name</strong></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td>horse_<wbr>no</td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Unless horse no is given, all newly imported horses will be sorted by name and given a number automatic, that is preferable</td>
</tr>
<tr>
<td>born_<wbr>year</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td>\A\d{4}\z</td>
</tr>
<tr>
<td colspan="5">4-digits birth year</td>
</tr>
<tr>
<td>sex</td>
<td style="text-align: center">string</td>
<td style="text-align: center">"unknown"</td>
<td></td>
</tr>
<tr>
<td colspan="5">S = Stallion, G = Gelding, M = Mare, unknown = Unknown</td>
</tr>
<tr>
<td>category</td>
<td style="text-align: center">string</td>
<td style="text-align: center">"H"</td>
<td></td>
</tr>
<tr>
<td colspan="5">H = Horse, A, B, C, D, E, 1, 2 or 3</td>
</tr>
<tr>
<td>licence</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">National licence</td>
</tr>
<tr>
<td>licence_<wbr>year</td>
<td style="text-align: center">string or integer</td>
<td style="text-align: center"></td>
<td>\A\d{4}\z</td>
</tr>
<tr>
<td colspan="5">The year licence is valid. 4 digits</td>
</tr>
<tr>
<td>fei_<wbr>id</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>country</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td>^[A-Z]{3}$</td>
</tr>
<tr>
<td colspan="5">The IOC code for the country in which the horse was born</td>
</tr>
<tr>
<td>color</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>breed</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Stud book of the horse in short, e.g. SWB or HANN</td>
</tr>
<tr>
<td>race</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>height</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>reg_<wbr>no</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Registration number of the horse</td>
</tr>
<tr>
<td>breeder</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Breeder of the horse</td>
</tr>
<tr>
<td>owner</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">Current owner of the horse</td>
</tr>
<tr>
<td>sire</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>dam</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>dams_<wbr>dam</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>dam_<wbr>sire</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>dams_<wbr>damsire</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>notes</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td>custom_<wbr>fields</td>
<td style="text-align: center">object</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">The object key refers to the key in [custom_field_names](SHOW.md) on show</td>
</tr>
</tbody>
</table>