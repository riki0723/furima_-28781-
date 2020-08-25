# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| familyname | string | null: false |
| firstyname | string | null: false |
| kana       | string | null: false |
| date       | string | null: false |


### Association
- has_many :items
- has_many :coments
- has_many :buys



## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| image     | string     | null: false                    |
| name      | string     | null: false                    |
| text      | string     | null: false                    |
| category  | string     | null: false                    |
| status    | string     | null: false                    |
| integer   | string     | null: false                    |
| area      | string     | null: false                    |
| days      | string     | null: false                    |
| price     | string     | null: false                    |
| user      | references | null: false, foreign_key: true |



### Association
- belongs_to :user
- has_many :coments
- has_one :buy



## coments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| massage  | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |



### Association
- belongs_to :user
- belongs_to :item



## buys テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :mailing




## mailings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| address      | string     | null: false                    |
| adressnumber | string     | null: false                    |
| buy          | references | null: false, foreign_key: true |


### Association
- belongs_to :buy