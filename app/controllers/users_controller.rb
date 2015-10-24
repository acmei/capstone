class UsersController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user, only: [:update]

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
    elsif user_params[:is_therapist] == "true"
      render :new_therapist
    else
      render :new
    end
  end

  def show
    @user = current_user
    @photos = Photo.all
    @questions = @user.questions
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "User profile updated"
      redirect_to settings_path
    else
      render settings_path
    end
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :is_therapist)
  end

  # Confirms a logged-in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


end
