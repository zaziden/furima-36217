FactoryBot.define do
  factory :destination_order do
    post_code         {'123-1111'}
    prefecture_id     {2}
    city              {'ももも'}
    street_number     {'ののの'}
    building_name     {'こここ'}
    phone_number      {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
