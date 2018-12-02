class ListMaintenance::LocalHabitatsController < ApplicationController
  before_action :set_local_habitat, only: [:edit, :update, :destroy]

  def index
    @local_habitats = LocalHabitat.all
  end

  def new
    @local_habitat = LocalHabitat.new
  end

  def edit; end

  def create
    @local_habitat = LocalHabitat.new(local_habitat_params)
    if @local_habitat.save
      redirect_to local_habitats_path
      flash[:notice] = 'Local Habitat was successfully created.'
    else
      render :new
    end
  end

  def update
    if @local_habitat.update(local_habitat_params)
      redirect_to local_habitats_path
      flash[:notice] = 'Local Habitat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @local_habitat.destroy
    redirect_to local_habitats_path
    flash[:notice] = 'Local Habitat was successfully destroyed.'
  end

  private

  def local_habitat_params
    params.require(:local_habitat).permit(:label)
  end

  def set_local_habitat
    @local_habitat = LocalHabitat.find(params[:id])
  end

end
