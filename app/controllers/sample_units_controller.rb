class SampleUnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sample_unit, only: [:show, :edit, :update, :destroy]

  def index
    @sample_units = SampleUnit.all
  end

  def show; end

  def new
    @sample_unit = SampleUnit.new
  end

  def edit; end

  def create
    @sample_unit = SampleUnit.new
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
    params.require(:detector).permit(:site_code)
  end

  def set_sample_unit
    @sample_unit = SampleUnit.find(params[:id])
  end
end
