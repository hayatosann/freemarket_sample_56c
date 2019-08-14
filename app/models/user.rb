class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.find_for_oauth(auth)
    user=User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :bought_plural, class_name: "Purchase", dependent: :destroy
  has_many :sold_plural, class_name: "Purchase", dependent: :destroy
  has_many :comments
  has_many :products, through: :comments
  has_one :address
  has_one :card
  has_many :purchases
end
