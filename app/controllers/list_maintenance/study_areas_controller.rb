class ListMaintenance::StudyAreasController < ApplicationController
  before_action :set_study_areas, only: [:edit, :update, :destroy]

  def index
    @study_areas = StudyArea.all
  end

  def new
    @study_area = StudyArea.new
  end

  def edit; end

  def create
    @study_area = StudyArea.new(study_areas_params)
    if @study_area.save
      redirect_to study_areas_path
      flash[:notice] = 'Study area was successfully created.'
    else
      render :new
    end
  end

  def update
    if @study_area.update(study_areas_params)
      redirect_to study_areas_path
      flash[:notice] = 'Study area was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @study_area.destroy
    redirect_to study_areas_path
    flash[:notice] = 'Study area was successfully destroyed.'
  end

  private

  def study_areas_params
    params.require(:study_area).permit(:name, :state_id)
  end

  def set_study_areas
    @study_area = StudyArea.find(params[:id])
  end
end
