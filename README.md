# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birth_day          | date   | null: false               |

### Association
* has_many :items
* has_many :orders

## items テーブル

| Column             | Type         | Options           |
| ------------------ | ------------ | ----------------- |
| user               | references   | foreign_key: true |
| name               | string       | null: false       |
| description        | text         | null: false       |
| category_id        | integer      | null: false       |
| item_condition_id  | integer      | null: false       |
| delivery_charge_id | integer      | null: false       |
| area_id            | integer      | null: false       |
| preparation_day_id | integer      | null: false       |
| price              | integer      | null: false       |

### Association
* belongs_to :user
* has_one :order

## destinations テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ------------------|
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| street_number | string     | null: false       |
| building_name | string     |                   |
| phone_number  | string     | null: false       |
| order         | references | foreign_key: true |

### Association
* belongs_to :order

## orders テーブル

| Column      | Type       | Options           |
| ----------- | -----------| ----------------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association
* belongs_to :user
* has_one :destination
* has_one :item 
