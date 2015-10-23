class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
    if request.fullpath == "/signup"
      return render :new
    else
      return render :new_therapist
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:notice] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @user = current_user
    @questions = @user.questions
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
  end

end
