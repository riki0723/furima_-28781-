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
| berthday   | date   | null: false |


### Association
- has_many :items
- has_many :coments
- has_many :buys



## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| image     | string     | null: false                    |
| name      | string     | null: false                    |
| explation | text       | null: false                    |
| category  | integer    | null: false                    |
| status    | integer    | null: false                    |
| integer   | integer    | null: false                    |
| area      | integer    | null: false                    |
| days      | integer    | null: false                    |
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