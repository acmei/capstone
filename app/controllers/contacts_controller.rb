class ContactsController < ApplicationController
  before_action :require_login
  before_action :define_user

  def index
    @contacts = @user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "#{@contact.name.titlecase} sucessfully added to contacts"
      redirect_to contacts_path
    else
      flash[:error] = "Something went wrong. Please try again."
      render :new
    end
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact.update(contact_params)
    if @contact.save
      flash[:success] = "Your contact has been updated."
      redirect_to contacts_path
    else
      flash.now[:error] = "Something went wrong. Please try again."
      render :edit
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    flash[:notice] = "Contact has been deleted."
    redirect_to contacts_path
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :phone, :user_id)
    end

end
