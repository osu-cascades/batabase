class ListMaintenance::ClutterTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clutter_type, only: [:edit, :update, :destroy]

  def index
    @clutter_types = ClutterType.all
  end

  def new
    @clutter_type = ClutterType.new
  end

  def edit; end

  def create
    @clutter_type = ClutterType.new(clutter_type_params)
    if @clutter_type.save
      redirect_to clutter_types_path
      flash[:notice] = 'Clutter type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @clutter_type.update(clutter_type_params)
      redirect_to clutter_types_path
      flash[:notice] = 'Clutter type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @clutter_type.destroy
    redirect_to clutter_types_path
    flash[:notice] = 'Clutter type was successfully destroyed.'
  end

  private

  def clutter_type_params
    params.require(:clutter_type).permit(:label)
  end

  def set_clutter_type
    @clutter_type = ClutterType.find(params[:id])
  end

end
