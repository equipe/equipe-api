---
title: Start
position: 5.0
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
<td colspan="5">When importing entries, this should be your primary key for this resource. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute</td>
</tr>
<tr>
<td>competition_<wbr>no</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Competition no, the competition must exist in competitions</td>
</tr>
<tr>
<td><strong>rider_<wbr>id</strong></td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ID of the rider, the rider must exist in people</td>
</tr>
<tr>
<td>payer_<wbr>id</td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ID of the payer, the payer must exist in people</td>
</tr>
<tr>
<td>horse_<wbr>id</td>
<td style="text-align: center">integer</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">ID of the horse, the horse must exist in people</td>
</tr>
<tr>
<td>category</td>
<td style="text-align: center">string</td>
<td style="text-align: center">"H"</td>
<td></td>
</tr>
<tr>
<td colspan="5">One of "H", "A", "B", "C", "D", "E", "1", "2", "3"</td>
</tr>
<tr>
<td>section</td>
<td style="text-align: center">string</td>
<td style="text-align: center">"A"</td>
<td></td>
</tr>
<tr>
<td colspan="5">A = Section A, B = Section B (Young horses)</td>
</tr>
<tr>
<td>late_<wbr>entry</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">When true, the late entry fee will be applied</td>
</tr>
<tr>
<td>status</td>
<td style="text-align: center">string</td>
<td style="text-align: center">""</td>
<td></td>
</tr>
<tr>
<td colspan="5">One of "", "withdrawn", "unpaid", "no_show", "changed", "reserve", "starting"</td>
</tr>
<tr>
<td>outside_<wbr>comp</td>
<td style="text-align: center">boolean</td>
<td style="text-align: center">false</td>
<td></td>
</tr>
<tr>
<td colspan="5">When true, this start will not be ranked</td>
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