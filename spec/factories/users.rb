FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'あああ'}
    family_name           {'いいい'}
    first_name_kana       {'アアア'}
    family_name_kana      {'イイイ'}
    birth_day             {'19861013'}
  end
end