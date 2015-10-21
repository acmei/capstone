class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_default_photo(@user)
      @user.send_activation_email
      flash[:notice] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end


private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
