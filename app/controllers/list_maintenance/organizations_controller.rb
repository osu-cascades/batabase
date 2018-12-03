class ListMaintenance::OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: [:edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def edit; end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to organizations_path
      flash[:notice] = 'Organization was successfully created.'
    else
      render :new
    end
  end

  def update
    if @organization.update(organization_params)
      redirect_to organizations_path
      flash[:notice] = 'Organization was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @organization.destroy
    redirect_to organizations_path
    flash[:notice] = 'Organization was successfully destroyed.'
  end

  private

  def organization_params
    params.require(:organization).permit(:label)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

end
