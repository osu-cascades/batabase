class ListMaintenance::DetectorsController < ApplicationController
  before_action :set_detector, only: [:edit, :update, :destroy]

  def index
    @detectors = Detector.all
  end

  def new
    @detector = Detector.new
  end

  def edit; end

  def create
    @detector = Detector.new(detector_params.merge(created_by: current_user, last_modified_by: current_user))
    if @detector.save
      redirect_to detectors_path
      flash[:success] = 'detector was successfully created.'
    else
      render :new
      flash[:error] = 'Detector was not successfully created.'
    end
  end

  def update
    if @detector.update(detector_params)
      redirect_to detectors_path
      flash[:success] = 'Detector was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @detector.destroy
    redirect_to detectors_path
    flash[:success] = 'Detector was successfully destroyed.'
  end

  private

  def detector_params
    params.require(:detector).permit(:serial_num, :model, :manufacturer, :firmware, :owning_agency)
  end

  def set_detector
    @detector = Detector.find(params[:id])
  end

end
