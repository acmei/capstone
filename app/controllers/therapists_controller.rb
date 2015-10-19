class TherapistsController < ApplicationController
  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.new(therapist_params)
    if @therapist.save
      log_in @therapist
      redirect_to @therapist
    else
      render :new
    end
  end

  def show
    @therapist = Therapist.find(params[:id])
  end


private

  def therapist_params
    params.require(:therapist).permit(:name, :email, :phone, :password, :password_confirmation)
  end

end
