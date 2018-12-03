class ListMaintenance::SpeciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_species, only: [:edit, :update, :destroy]

  def index
    @species = Species.all
  end

  def new
    @specie = Species.new
  end

  def edit; end

  def create
    @specie = Species.new(species_params)
    if @specie.save
      redirect_to species_index_path
      flash[:notice] = 'Species was successfully created.'
    else
      render :new
    end
  end

  def update
    if @specie.update(species_params)
      redirect_to species_index_path
      flash[:notice] = 'Species was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @specie.destroy
    redirect_to species_index_path
    flash[:notice] = 'Species was successfully destroyed.'
  end

  private

  def species_params
    params.require(:species).permit(:code, :common_name, :scientific_name, :tsn)
  end

  def set_species
    @specie = Species.find(params[:id])
  end
end
