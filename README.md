# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_one  :purchase

## items テーブル

| Column       | Type          | Options     |
| ------------ | ------------- | ----------- |
| item_name    | string        | null: false |
| information  | text          | null: false |
| category     | string        | null: false |
| status       | string        | null: false |
| shipping_fee | string        | null: false |
| prefecture   | string        | null: false |
| schedule     | string        | null: false |
| price        | integer       | null: false |
| user         | references    |             |

### Association

- belongs_to :user
- has_one  :purchase

## purchase テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | references |             |
| item             | references |             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## delivery テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal_code | string     | null: false |
| prefecture  | string     | null: false |
| city        | string     | null: false |
| address     | string     | null: false |
| building    | string     |             |
| tell        | integer    | null: false |

### Association

- belongs_to :purchase