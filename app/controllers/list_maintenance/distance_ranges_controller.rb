class ListMaintenance::DistanceRangesController < ApplicationController
  before_action :set_distance_range, only: [:edit, :update, :destroy]

  def index
    @distance_ranges = DistanceRange.all
  end

  def new
    @distance_range = DistanceRange.new
  end

  def edit; end

  def create
    @distance_range = DistanceRange.new(distance_range_params)
    if @distance_range.save
      redirect_to distance_ranges_path
      flash[:success] = 'Distance Range was successfully created.'
    else
      render :new
    end
  end

  def update
    if @distance_range.update(distance_range_params)
      redirect_to distance_ranges_path
      flash[:success] = 'Distance Range was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @distance_range.destroy
    redirect_to distance_ranges_path
    flash[:success] = 'Distance Range was successfully destroyed.'
  end

  private

  def distance_range_params
    params.require(:distance_range).permit(:label)
  end

  def set_distance_range
    @distance_range = DistanceRange.find(params[:id])
  end

end
