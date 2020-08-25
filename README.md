# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| kana     | string | null: false |
| date     | string | null: false |


### Association
- has_many :items
- has_many :coments
- has_many :buys



## items テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| image     | string | null: false |
| imagename | string | null: false |
| text      | string | null: false |
| category  | string | null: false |
| status    | string | null: false |
| integer   | string | null: false |
| area      | string | null: false |
| days      | string | null: false |
| price     | string | null: false |



### Association
- belongs_to :user
- has_many :coments
- has_one :buy



## coments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| massage  | string | null: false |
|          | string | null: false |

### Association
- belongs_to :user
- belongs_to :item



## items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| cardid       | string | null: false |
| address      | string | null: false |
| adressnumber | string | null: false |

### Association
- belongs_to :user
- belongs_to :item