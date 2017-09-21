---
title: Club
position: 4.0
right_code: |
  ~~~ json
  {
    "id":10001,
    "name":"Helsingborgs Fältrittklubb",
    "short":"HFRK",
    "logo_id":"0235",
    "logo_group":"svrf"
  }
  ~~~
  {: title="Example record of Club" }
  
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
<td>short</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td>logo_<wbr>id</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Refers to our central repository for logos which are shared between all our systems. When logo_id is a number and less then 4 digits, prefix it with zero. Example 54 should be 0054</td>
</tr>
<tr>
<td>logo_<wbr>group</td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
</tbody>
</table>