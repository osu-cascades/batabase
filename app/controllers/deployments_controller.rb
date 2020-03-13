# frozen_string_literal: true

class DeploymentsController < ApplicationController
  def index
    @deployments_grid = DeploymentsGrid.new(params[:deployments_grid])
  end
end
