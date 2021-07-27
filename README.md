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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birth_day          | date   | null: false |

## items テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| user               | references   |             |
| name               | string       | null: false |
| item_description   | text         | null: false |
| category           | string       | null: false |
| item_condition     | string       | null: false |
| delivery_charge    | string       | null: false |
| area               | string       | null: false |
| preparation_day    | integer      | null: false |
| price              | integer      | null: false |
| image              | ActiveStorage|             |

## destination テーブル

| Column             | Type          | Options     |
| ------------------ | ------------- | ----------- |
| post_code          | string        | null: false |
| prefecture         | text          | null: false |
| city               | text          | null: false |
| street_number      | text          | null: false |
| building_name      | text          | null: false |
| phone_number       | integer       | null: false |
| user               | references    |             |
| credit_card        | references    |             |

## credit_cards テーブル

| Column             | Type          | Options     |
| ------------------ | ------------- | ----------- |
| card_number        | integer       | null: false |
| expiration_date    | integer       | null: false |
| security_code      | integer       | null: false |
| user               | references    |             |