class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bought_plural, class_name: "Purchase", dependent: :destroy
  has_many :sold_plural, class_name: "Purchase", dependent: :destroy
  has_many :comments
  has_many :products, through: :comments
  has_one :address
  has_one :card
  has_many :purchases
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
end
