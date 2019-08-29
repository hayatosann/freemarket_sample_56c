class Product < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images,allow_destroy: true, reject_if: :all_blank

  # has_many :comments
  # has_many :users through: :comments
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :prefecture_from
  belongs_to_active_hash :shipping_days
  belongs_to :category

  

  def previous
    Product.where("id < ?",id).order("id DESC").first
  end


  def next
    Product.where("id > ?",id).order("id ASC").first
  end

  validates :name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :size_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :shipping_method_id, presence: true
  validates :prefecture_from_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :user_id, presence: true
  validates :status, presence: true
  validates :images, presence:true
end

