class ListMaintenance::BroadHabitatFormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_broad_habitat_form, only: [:edit, :update, :destroy]

  def index
    @broad_habitat_forms = BroadHabitatForm.all
  end

  def new
    @broad_habitat_form = BroadHabitatForm.new
  end

  def edit; end

  def create
    @broad_habitat = BroadHabitatForm.new(broad_habitat_form_params)
    if @broad_habitat.save
      redirect_to broad_habitats_path, notice: 'Broad habitat was successfully created.'
    else
      render :new
    end
  end

  def update
    if @broad_habitat.update(broad_habitat_params)
      redirect_to broad_habitats_path, notice: 'Broad habitat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @broad_habitat.destroy
    redirect_to broad_habitats_path, notice: 'Broad habitat was successfully destroyed.'
  end

  private

  def broad_habitat_form_params
    params.require(:broad_habitat).permit(:label)
  end

  def set_broad_habitat_form
    @broad_habitat = BroadHabitatForm.find(params[:id])
  end
end
