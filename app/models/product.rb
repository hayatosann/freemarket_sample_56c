class Product < ApplicationRecord
  belongs_to :user
  has_many :images 
  # has_many :comments
  has_many :users through :comments
  belongs_to_active_hash :size_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :delivery_fee_id
  belongs_to_active_hash :shipping_method_id
  belongs_to_active_hash :prefecture_from_id
  belongs_to_active_hash :shipping_days_id
  belongs_to :brand
  belongs_to :category

end
