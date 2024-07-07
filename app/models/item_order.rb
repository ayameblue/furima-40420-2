class ItemOrder < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :street, :building, :phone_number, :item_id, :user_id


  with_options presence: true do
    validates :token, :city, :street, presence: true
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

    def save
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number)
      Order.create(user_id: user_id, item_id: item_id)
    end
end
