class Product < ApplicationRecord
  belongs_to :user
  has_many :images 
  mount_uploader :image, ImageUploader
  
  accepts_nested_attributes_for :images
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

  def previous
    Product.where("id < ?",id).order("id DESC").first
  end


  def next
    Product.where("id > ?",id).order("id ASC").first
  end

end

