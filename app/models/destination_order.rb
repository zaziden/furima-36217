class DestinationOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
    validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank" }
  end  

  def save

    order = Order.create(item_id: item_id, user_id: user_id)

    Destination.create(building_name: building_name, post_code: post_code, city: city, street_number: street_number, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end
end