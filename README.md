# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| berthday | string | null: false |


### Association
- has_many :items
- has_many :coments
- has_many :buys



## items テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| image     | string | null: false |
| imagename | string | null: false |
| explation | string | null: false |
| category  | string | null: false |
| status    | string | null: false |
| charges   | string | null: false |
| area      | string | null: false |
| days      | string | null: false |
| price     | string | null: false |
| days      | string | null: false |


### Association
- belongs_to :users
- has_many :coments
- has_one :buys



## coments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| massage  | string | null: false |
|          | string | null: false |

### Association
- belongs_to :users
- belongs_to :items



## items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| cardid       | string | null: false |
| address      | string | null: false |
| adressnumber | string | null: false |

### Association
- belongs_to :users
- belongs_to :items