class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email_or_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_path
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:error] = message
        redirect_to root_url
      end
    else
      flash.now[:error] = "Invalid email/password combination."
      render 'new'
    end
  end

  def google
    if params[:provider] == 'google_oauth2'
      auth_hash = request.env['omniauth.auth'] || params
      user = User.find_or_create_from_omniauth(auth_hash)
      set_default_photo(user)
      log_in user
      redirect_to user
    else
      flash.now[:error] = "Oops, that didn't seem to work."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
