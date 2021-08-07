class Item < ApplicationRecord
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :item_condition_id
      validates :delivery_charge_id
      validates :area_id
      validates :preparation_day_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :preparation_day
  belongs_to :user, optional: true
  has_one_attached :image
  has_one :order
end
