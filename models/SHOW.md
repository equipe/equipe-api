## Show

General settings for the show

Attribute | Type | Mandatory | Default | Pattern | Description
--- | :---: | :---: | :---: | --- | ---
id | integer | Yes |  |  | On importing entries, this should be your primary key for the show. When exporting, this will be our internal id and your primary key will be in the foreign_id attribute
name | string | Yes | "Untitled" |  | Name of the show
starts_on | string | No |  | \A\d{4}-\d{2}-\d{2}\z | Start date of the show in the format YYYY-MM-DD
ends_on | string | No |  | \A\d{4}-\d{2}-\d{2}\z | End date of the show YYYY-MM-DD
currency | string | Yes |  |  | ISO 4217 formmated currency code used for accouting in the show. We will add more currencies when they are needed
foreign_tax | boolean | No | false |  | Will foreign tax apply or not (When used automatic for people not from foreign_tax_skip)
foreign_tax_percent | number | No | 15 |  | Foreign tax percent
foreign_tax_skip | string | No |  | ^[A-Z]{3}$ | The IOC code, foreign tax but not for people from this country, this is the country code where the show is located. This defaults to the country of the federation if left out
income_tax | boolean | No | false |  | Will income tax apply or not (When used automatic for people from foreign_tax_skip-country without company)
income_tax_percent | number | No | 30 |  | Income tax percent
always_income_tax | array | No | [] |  | When income tax is enabled, apply income tax to people from these countries instead of foreign tax. List of IOC codes
discount_club_id | integer or null | No | null |  | Gives discount for riders that competes for the club with this id (See also Competition#club_discount_percent_applied)
discount_club_percent | number or null | No | null |  | Discount percent for riders that competes for the club (See also Competition#club_discount_percent_applied)
penalty_fee | number or null | No | null |  | Penalty fee for starts marked with status no-show
credit_card_fee_percents | array | No | [] |  | Possibllty to add credit card fee % on invoices
accounts | array | No | ["tdb", "bank", "prepaid", "cash", "credit_card", "swish"] |  | List of payment accounts
default_account | string | No | "cash" |  | Default account must also exist in accounts
prize_money_equal_ranked | integer | No | 2 |  | 1 = Highest prize money, 2 = Prize money splits
withdrawn_pay | boolean | No | true |  | Will withdrawn starts pay the entry fee or not, when false the entry fee behave like a start fee
minimum_entry_fee_in_prize_money | boolean | No | false |  | When enabled it never give less the entry fee in prize money for placed starts
result_name | string | No | "" |  | Name of the person responsibly for the results
result_email | string | No | "" |  | Email of the person responsibly for the results
result_cell_phone | string | No | "" |  | Cell phone of the person responsibly for the results
publish_horse_labels | boolean | No | false |  | Publish horse labels to online.equipe.com
publish_prize_money | boolean | No | true |  | Publish prize money to online.equipe.com
publish_horse_no | boolean | No | true |  | Publish horse no to online.equipe.com
custom_field_names | object | No |  |  | Object where key is person, horse or start. See [Custom field](CUSTOM_FIELD.md)

**Example value of custom_field_names**
```json
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

```