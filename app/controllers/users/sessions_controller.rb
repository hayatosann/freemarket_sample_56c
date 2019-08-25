# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController


  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def create
  #   super
  #   user = User.find_by(email: params[:user][:email])
  #   if user
  #     if user.valid_password?(params[:user][:password]) 
  #       # sign_in_and_redirect user
  #       redirect_to root_path
  #     else
  #       flash[:error] =  "Please enter the valid password."
  #     end
  #   end
  # end

  # def new
  #   @login = Session.new
  # end

  # def create
  #   @login = Session.new(email: params[:session][:email], password: params[:session][:password])
  #   if @login.save && (@user = User.find_by(email: @login.email))&& @user.authenticate(@login.password)
  #     redirect_to users_path
  #   else
  #     render :new
  #   end
  # end


end
