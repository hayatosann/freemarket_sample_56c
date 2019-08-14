class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bought_plural, class_name: "Purchase", dependent: :destroy
  has_many :sold_plural, class_name: "Purchase", dependent: :destroy
  has_many :products
  # has_many :comments
  # has_many :products, through: :comments
  has_one :address
  has_one :card
  has_many :purchases
end
