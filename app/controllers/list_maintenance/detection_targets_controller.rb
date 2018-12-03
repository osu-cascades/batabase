class ListMaintenance::DetectionTargetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_detection_target, only: [:edit, :update, :destroy]

  def index
    @detection_targets = DetectionTarget.all
  end

  def new
    @detection_target = DetectionTarget.new
  end

  def edit; end

  def create
    @detection_target = DetectionTarget.new(detection_target_params)
    if @detection_target.save
      redirect_to detection_targets_path
      flash[:notice] = 'Detection target was successfully created.'
    else
      render :new
      flash[:error] = 'Detection target was not successfully created.'
    end
  end

  def update
    if @detection_target.update(detection_target_params)
      redirect_to detection_targets_path
      flash[:notice] = 'Detection target was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @detection_target.destroy
    redirect_to detection_targets_path
    flash[:notice] = 'Detection target was successfully destroyed.'
  end

  private

  def detection_target_params
    params.require(:detection_target).permit(:label)
  end

  def set_detection_target
    @detection_target = DetectionTarget.find(params[:id])
  end
end
