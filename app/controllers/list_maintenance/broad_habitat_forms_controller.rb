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
    @broad_habitat_form = BroadHabitatForm.new(broad_habitat_form_params)
    if @broad_habitat_form.save
      redirect_to broad_habitat_forms_path
      flash[:notice] = 'Broad habitat form was successfully created.'
    else
      render :new
    end
  end

  def update
    if @broad_habitat_form.update(broad_habitat_form_params)
      redirect_to broad_habitat_forms_path
      flash[:notice] = 'Broad habitat form was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @broad_habitat_form.destroy
    redirect_to broad_habitat_forms_path
    flash[:notice] = 'Broad habitat form was successfully destroyed.'
  end

  private

  def broad_habitat_form_params
    params.require(:broad_habitat_form).permit(:label, :broad_habitat_id)
  end

  def set_broad_habitat_form
    @broad_habitat_form = BroadHabitatForm.find(params[:id])
  end
end
