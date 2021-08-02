FactoryBot.define do
  factory :item do
    name                {'アイテム'}
    description         {'あああ'}
    category_id         {2}
    item_condition_id   {2}
    delivery_charge_id  {2}
    area_id             {2}
    preparation_day_id  {2}
    price               {'1000'}
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end