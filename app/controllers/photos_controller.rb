class PhotosController < ApplicationController
  def create
    user = current_user
    user.photo_id = params[:photo]
    user.save

    redirect_to settings_path
  end
end
