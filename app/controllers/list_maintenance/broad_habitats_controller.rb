class ListMaintenance::BroadHabitatsController < ApplicationController
  def index
    @broad_habitats = BroadHabitat.all
  end
end
