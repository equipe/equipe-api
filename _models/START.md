---
title: Start
position: 5.0
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
<td id="start_id">
<strong>id</strong>
<span class="searchable">id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">When importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute</td>
</tr>
<tr>
<td id="start_competition_no">
competition_<wbr>no
<span class="searchable">competition_no</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition no, the competition must exist in competitions</td>
</tr>
<tr>
<td id="start_rider_id">
<strong>rider_<wbr>id</strong>
<span class="searchable">rider_id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ID of the rider, the rider must exist in people</td>
</tr>
<tr>
<td id="start_payer_id">
payer_<wbr>id
<span class="searchable">payer_id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ID of the payer, the payer must exist in people</td>
</tr>
<tr>
<td id="start_horse_id">
horse_<wbr>id
<span class="searchable">horse_id</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ID of the horse, the horse must exist in people</td>
</tr>
<tr>
<td id="start_category">
category
<span class="searchable">category</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">"H"</td>
<td></td>
</tr>
<tr>
<td colspan="5">One of "H", "A", "B", "C", "D", "E", "1", "2", "3"</td>
</tr>
<tr>
<td id="start_section">
section
<span class="searchable">section</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">"A"</td>
<td></td>
</tr>
<tr>
<td colspan="5">A = Section A, B = Section B (Young horses)</td>
</tr>
<tr>
<td id="start_late_entry">
late_<wbr>entry
<span class="searchable">late_entry</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">When true, the late entry fee will be applied</td>
</tr>
<tr>
<td id="start_status">
status
<span class="searchable">status</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">One of "", "withdrawn", "unpaid", "no_show", "changed", "reserve", "starting"</td>
</tr>
<tr>
<td id="start_outside_comp">
outside_<wbr>comp
<span class="searchable">outside_comp</span></td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">When true, this start will not be ranked</td>
</tr>
<tr>
<td id="start_custom_fields">
custom_<wbr>fields
<span class="searchable">custom_fields</span></td>
<td style="text-align: center">object</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">The object key refers to the key in <a href="#show_custom_field_names">Show#custom_field_names</a></td>
</tr>
</tbody>
</table>