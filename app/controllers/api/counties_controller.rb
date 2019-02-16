module Api
  class CountiesController < ApplicationController
    def index
      @counties = County.where(state_id: params[:state_id]).order(:name)
      render json: @counties
    end
  end
end