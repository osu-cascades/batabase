class ListMaintenance::ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def edit; end

  def create
    @contact = Contact.new(contact_params.merge(created_by: current_user, last_modified_by: current_user))
    if @contact.save
      redirect_to contacts_path
      flash[:notice] = 'Contact was successfully created.'
    else
      render :new
      flash[:error] = 'Contact was not successfully created.'
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path
      flash[:notice] = 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
    flash[:notice] = 'Contact was successfully destroyed.'
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :organization_id, :state_id)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

end
