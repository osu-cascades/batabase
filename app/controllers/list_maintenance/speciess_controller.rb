class ListMaintenance::SpeciessController < ApplicationController
  before_action :set_species, only: [:edit, :update, :destroy]

  def index
    @speciess = Species.all
  end

  def new
    @species = Species.new
  end

  def edit; end

  def create
    @species = Speciess.new(species_params)
    if @species.save
      redirect_to speciess_path
      flash[:success] = 'Species was successfully created.'
    else
      render :new
    end
  end

  def update
    if @species.update(species_params)
      redirect_to speciess_path
      flash[:success] = 'Species was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @species.destroy
    redirect_to speciess_path
    flash[:success] = 'Species was successfully destroyed.'
  end

  private

  def species_params
    params.require(:species).permit(:label)
  end

  def set_species
    @species = Species.find(params[:id])
  end

end
