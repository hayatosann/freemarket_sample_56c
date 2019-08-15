class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

        def self.find_for_oauth(auth)
          user = User.where(uid: auth.uid, provider: auth.provider).first
      
          unless user
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              nickname:     auth.info.name,
              email:    auth.info.email,
              password: Devise.friendly_token[0, 20]
            )
          end

          user
        end
      
        def sns
          @user = User.new(
            nickname: session[:nickname],
            email: session[:email],
            password: session[:password],
            password_confirmation: session[:password],
            )
        end
      
        def create
          super
          @user.uid = session[:uid]
          @user.provider = session[:provider]
          @user.save
        end

  has_many :bought_plural, class_name: "Purchase", dependent: :destroy
  has_many :sold_plural, class_name: "Purchase", dependent: :destroy
  has_many :products
  #  取引成立前のコメント機能は後ほど実装予定
  # has_many :comments
  # has_many :products, through: :comments
  has_one :address
  has_one :card
  has_many :purchases
end
