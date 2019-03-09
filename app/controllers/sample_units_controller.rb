class SampleUnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sample_unit, only: [:show, :edit, :update, :destroy]

  def index
    @sample_units = SampleUnit.order(:agency).page params[:page]
    @page = params[:page].to_i || 1
  end

  def show
    @sample_unit = SampleUnitDecorator.find(params[:id])
    @detector_locations = @sample_unit.detector_locations
  end

  def new
    @sample_unit = SampleUnit.new
    4.times { @sample_unit.detector_locations.build }
  end

  def edit; end

  def create
    @sample_unit = SampleUnit.new(sample_unit_params)
    if @sample_unit.save
      redirect_to sample_units_path
      flash[:notice] = 'Sample unit was successfully created.'
    else
      flash[:error] = 'Sample unit was not successfully created.'
      render :new
    end
  end

  def update
    if @sample_unit.update(detector_params)
      redirect_to sample_units_path
      flash[:notice] = 'Sample unit was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sample_unit.destroy
    redirect_to sample_units_path
    flash[:notice] = 'Sample unit was successfully destroyed.'
  end

  private

  def sample_unit_params
    params.require(:sample_unit).permit(:site_code, :grts, :agency, :broad_habitat_id, :species_group_id,
      detector_locations_attributes: [:sample_unit_id, :local_habitat_id ,:location_name])
  end

  def set_sample_unit
    @sample_unit = SampleUnit.find(params[:id])
  end
end
