class Product < ApplicationRecord
  belongs_to :user
  # belongs_to :user, :large_category, :medium_category, :small_category, optional: true, :brand, optional: true
  has_many :images 
  # has_many :comments
  has_many :users through :comments
  belongs_to_active_hash :size_id
  # belongs_to_active_hash :brand_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :delivery_fee_id
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :prefecture_from
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :large_category
  has_many :brands
  belongs_to :category

end
