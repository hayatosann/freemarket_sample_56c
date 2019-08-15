class UsersController < ApplicationController
  def mypage
  end
  
  def sign_out
  end

  def infomation
    @user = User.new
  end

  def sms_confirmation
    # sessionにフォーム情報を格納
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    # フォームデータを元にDateオブジェクトを作成してからsessionに格納
    session[:birthday] = Date.new(user_params["birthday(1i)"]&.to_i, user_params["birthday(2i)"]&.to_i, user_params["birthday(3i)"]&.to_i)
    # /users/addressでユーザー情報の表示をするため、そこまではuser_paramsを使ってインスタンスを作って渡していく形でデータを保持
    @user = User.new(user_params)

    render :sms_confirmation
  end

  def address
    session[:phone] = user_params[:phone]
    @user = User.new(user_params)
    @address = Address.new

    render :address
  end

  def payment
    session[:postal_code] = address_params[:postal_code]
    session[:prefecture_id] = address_params[:prefecture_id]
    session[:city] = address_params[:city]
    session[:block] = address_params[:block]
    session[:building] = address_params[:building]
    session[:sub_phone] = address_params[:sub_phone]
    @card = Card.new
  end

  def complete
    session[:number] = card_params[:number]
    session[:expiration_date] = Date.new(card_params["expiration_date(1i)"]&.to_i, card_params["expiration_date(2i)"]&.to_i + 1) - 1
    session[:security_code] = card_params[:security_code]

    # sessionに貯めてきたデータでUser, Address, CardをCreateする
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone: session[:phone]
    )
    @address = @user.build_address(
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      sub_phone: session[:sub_phone]
    )
    @card = @user.build_card(
      number: session[:number],
      expiration_date: session[:expiration_date],
      security_code: session[:security_code]
    )
    unless @user.valid?
      redirect_to new_user_registration_path
    end
    @user.save
    @address.save
    @card.save
  end
  
  def show
  end

  def identification
  end
  
  def credit_confirmation
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :phone, :image, :profile)
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :block, :building, :sub_phone, :user_id)
  end

  def card_params
    params.require(:card).permit(:number, :expiration_date, :security_code, :user_id)
  end
end
