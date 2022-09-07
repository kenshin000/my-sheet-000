# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| nickname           | string | null: false              |
| email              | string | null: false  unique: true|
| encrypted_password | string | null: false              |


has_many :languages
has_many :posts

## languages テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| name               | string | null: false              |
| user     | references | null: false, foreign_key: true |

belongs_to :user
has_many :posts

## posts テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| title              | string | null: false              |
| text               | text   | null: false              |
| language | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :language