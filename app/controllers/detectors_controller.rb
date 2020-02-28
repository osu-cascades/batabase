class DetectorsController < ApplicationController
  def index
    @detectors_grid = DetectorsGrid.new(params[:detectors_grid])
  end
end