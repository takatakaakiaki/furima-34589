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
| category     | string        | null: false |
| status       | string        | null: false |
| shipping-fee | string        | null: false |
| prefecture   | string        | null: false |
| schedule     | string        | null: false |
| price        | integer       | null: false |
| user         | references    |             |

### Association

- belongs_to :user
- has_one  :purchase
- has_one  :delivery
- has_one  :comment

## purchase テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card-number      | integer    | null: false |
| expiration-month | integer    | null: false |
| expiration-year  | integer    | null: false |
| security-code    | integer    | null: false |
| user             | references |             |
| item             | references |             |

### Association

- belongs_to :user
- belongs_to :item

## delivery テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal-code | integer    | null: false |
| prefecture  | string     | null: false |
| city        | string     | null: false |
| address     | string     | null: false |
| building    | string     |             |
| tell        | integer    | null: false |
| user        | references |             |
| item        | references |             |

### Association

- belongs_to :user
- belongs_to :item