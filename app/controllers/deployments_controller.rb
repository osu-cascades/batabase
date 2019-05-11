class DeploymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deployment, only: [:show, :edit, :update, :destroy]

  def index
    @deployments = Deployment.all.page params[:page]
    @page = params[:page].to_i || 1
  end

  def show; end

  def new
    @deployment = Deployment.new
  end

  def edit; end

  def create
    @deployment = Deployment.new(deployment_params)
    if @deployment.save
      redirect_to deployments_path
      flash[:notice] = 'Deployment was successfully created.'
    else
      flash[:error] = 'Deployment was not successfully created.'
      render :new
    end
  end


  def update
    if @deployment.update(sample_unit_params)
      redirect_to deployments_path
      flash[:notice] = 'Deployment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @deployment.destroy
    redirect_to deployments_path
    flash[:notice] = 'Deployment was successfully destroyed.'
  end

  private

  def deployment_params
    params.require(:deployment).permit(:point_location_id)
  end

  def set_deployment
    @deployment = Deployment.find(params[:id])
  end
end
