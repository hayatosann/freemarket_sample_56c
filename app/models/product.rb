class Product < ApplicationRecord
  belongs_to :user
  has_many :images 
  accepts_nested_attributes_for :images
  mount_uploader :image_path, ImageUploader
  # has_many :comments
  # has_many :users through: :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :prefecture_from
  belongs_to_active_hash :shipping_days
  belongs_to :brand
  belongs_to :category
  belongs_to_active_hash :brand
  belongs_to_active_hash :category

end

