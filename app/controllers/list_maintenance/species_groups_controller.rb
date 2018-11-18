class ListMaintenance::SpeciesGroupsController < ApplicationController
  before_action :set_species_group, only: [:edit, :update, :destroy]

  def index
    @species_groups = SpeciesGroup.all
  end

  def new
    @species_group = SpeciesGroup.new
  end

  def edit; end

  def create
    @species_group = SpeciesGroup.new(species_group_params)
    if @species_group.save
      redirect_to species_groups_path
      flash[:success] = 'Species Group was successfully created.'
    else
      render :new
    end
  end

  def update
    if @species_group.update(species_group_params)
      redirect_to species_groups_path
      flash[:success] = 'Species Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @species_group.destroy
    redirect_to species_groups_path
    flash[:success] = 'Species Group was successfully destroyed.'
  end

  private

  def species_group_params
    params.require(:species_group).permit(:label)
  end

  def set_species_group
    @species_group = SpeciesGroup.find(params[:id])
  end

end
