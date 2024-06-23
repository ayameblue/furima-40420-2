class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category, class_name: 'Category'
  belongs_to_active_hash :condition, class_name: 'Condition'
  belongs_to_active_hash :delivery_day, class_name: 'DeliveryDay'
  belongs_to_active_hash :delivery_fee, class_name: 'DeliveryFee'
  belongs_to_active_hash :prefecture, class_name: 'Prefecture'

  validates :category_id, :condition_id, :delivery_day_id, :delivery_fee_id, :prefecture_id,  presence: true

  validates :category_id, :condition_id, :delivery_day_id, :delivery_fee_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, presence: true, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: "Price must be greater than or equal to 300" }
  validates :price, numericality: { less_than_or_equal_to: 9999999, message: "Price must be less than or equal to 9999999" }
  validates :image, presence: true
end
