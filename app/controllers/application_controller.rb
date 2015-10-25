class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  QUESTION_CATEGORIES = ["urge", "rating", "med", "action", "emotion", 
                        "optional", "session_urge", "session_reg", "session", "skill"]

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end

  def define_user
    if logged_in?
      @user = User.find(session[:user_id])
    end
  end
  
end
