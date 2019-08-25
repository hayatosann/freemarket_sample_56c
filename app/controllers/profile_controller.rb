class ProfileController < ApplicationController
  before_action :set_user, only: [:edit, :create]
  before_action :authenticate_user!, only: [:edit, :create]

  def edit

  end

  def create
    @user.nickname = profile_params[:nickname]
    @user.profile = profile_params[:profile]
    if @user.save(validate: false)
      flash[:success] = "登録しました"
    else
      flash[:danger]="失敗しました"
    end
    render :edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:profile, :nickname)
  end
end