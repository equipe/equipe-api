---
title: Custom entry fee
position: 7.0
right_code: |
  ~~~ json
  {
    "name":"Stable service",
    "vat":20,
    "amount":320
  }
  ~~~
  {: title="Example record of Custom entry fee" }
  
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
<strong>name</strong>
<span class="searchable">name</span></td>
<td style="text-align: center">string</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">Name of the fee</td>
</tr>
<tr>
<td>
<strong>vat</strong>
<span class="searchable">vat</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">VAT included by %</td>
</tr>
<tr>
<td>
<strong>amount</strong>
<span class="searchable">amount</span></td>
<td style="text-align: center">number</td>
<td style="text-align: center"></td>
<td></td>
</tr>
<tr>
<td colspan="5">The amount including VAT</td>
</tr>
</tbody>
</table>