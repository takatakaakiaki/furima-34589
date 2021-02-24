# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| last-name         | string | null: false |
| first-name        | string | null: false |
| last-name(ruby)   | string | null: false |
| first-name(ruby)  | string | null: false |
| birthday-year     | string | null: false |
| birthday-month    | string | null: false |
| birthday-day      | string | null: false |

### Association

- has_many :items
- has_one  :purchase
- has_one  :delivery
- has_one  :comment


## items テーブル

| Column       | Type          | Options     |
| ------------ | ------------- | ----------- |
| item-name    | string        | null: false |
| information  | text          | null: false |
| category     | string          | null: false |
| status       | string    |             |
| shipping-fee | string
| prefecture   | string
| schedule     | string
| price        | integer
| user         | 









### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type       | Options     |
| ------    | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| prototype | references |             |

### Association

- belongs_to :prototype
- belongs_to :user