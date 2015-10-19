class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:provider] == 'google_oauth2'
      auth_hash = request.env['omniauth.auth'] || params
      user = User.find_or_create_from_omniauth(auth_hash)
      log_in user
      redirect_to user
    elsif user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:error] = "Invalid email/password combination."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
