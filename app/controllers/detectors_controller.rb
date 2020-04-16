class DetectorsController < ApplicationController
  def index
    @detectors_grid = DetectorsGrid.new(params[:detectors_grid])
  end

  def new
    @detector = Detector.new
  end
end