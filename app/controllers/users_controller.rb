class UsersController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user, :define_user, only: [:show, :update, :set_therapist]

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
    @photos = Photo.all
    @question = Question.new
    @therapists = User.therapists

    QUESTION_CATEGORIES.each do |category|
      instance_variable = ("@" + category.pluralize).to_sym # :@urges
      instance_variable_set(instance_variable, Question.category(category))
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "User profile updated"
      redirect_to settings_path
    else
      render settings_path
    end
  end

  def favorites
    define_user
    @favorites = @user.skills
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :therapist_id, :is_therapist)
  end

  # Confirms a logged-in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


end
