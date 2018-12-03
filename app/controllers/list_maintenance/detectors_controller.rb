class ListMaintenance::DetectorsController < ApplicationController
  before_action :authenticate_user!
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
      flash[:notice] = 'Detector was successfully created.'
    else
      flash[:error] = 'Detector was not successfully created.'
      render :new
    end
  end

  def update
    if @detector.update(detector_params)
      redirect_to detectors_path
      flash[:notice] = 'Detector was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @detector.destroy
    redirect_to detectors_path
    flash[:notice] = 'Detector was successfully destroyed.'
  end

  private

  def detector_params
    params.require(:detector).permit(:serial_num, :model, :manufacturer, :firmware, :organization_id)
  end

  def set_detector
    @detector = Detector.find(params[:id])
  end
end
