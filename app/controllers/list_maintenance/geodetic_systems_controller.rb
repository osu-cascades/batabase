class ListMaintenance::GeodeticSystemsController < ApplicationController
  before_action :set_geodetic_system, only: [:edit, :update, :destroy]

  def index
    @geodetic_systems = GeodeticSystem.all
  end

  def new
    @geodetic_system = GeodeticSystem.new
  end

  def edit; end

  def create
    @geodetic_system = GeodeticSystem.new(geodetic_system_params)
    if @geodetic_system.save
      redirect_to geodetic_systems_path
      flash[:success] = 'Geodetic system was successfully created.'
    else
      render :new
    end
  end

  def update
    if @geodetic_system.update(geodetic_system_params)
      redirect_to geodetic_systems_path
      flash[:success] = 'Geodetic system was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @geodetic_system.destroy
    redirect_to geodetic_systems_path
    flash[:success] = 'Geodetic system was successfully destroyed.'
  end

  private

  def geodetic_system_params
    params.require(:geodetic_system).permit(:label)
  end

  def set_geodetic_system
    @geodetic_system = GeodeticSystem.find(params[:id])
  end

end
