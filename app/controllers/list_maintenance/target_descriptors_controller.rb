class ListMaintenance::TargetDescriptorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_target_descriptor, only: [:edit, :update, :destroy]

  def index
    @target_descriptors = TargetDescriptor.all
  end

  def new
    @target_descriptor = TargetDescriptor.new
  end

  def edit; end

  def create
    @target_descriptor = TargetDescriptor.new(target_descriptor_params)
    if @target_descriptor.save
      redirect_to target_descriptors_path
      flash[:notice] = 'Target descriptor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @target_descriptor.update(target_descriptor_params)
      redirect_to target_descriptors_path
      flash[:notice] = 'Target descriptor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @target_descriptor.destroy
    redirect_to target_descriptors_path
    flash[:notice] = 'Target descriptor was successfully destroyed.'
  end

  private

  def target_descriptor_params
    params.require(:target_descriptor).permit(:label, :detection_target_id)
  end

  def set_target_descriptor
    @target_descriptor = TargetDescriptor.find(params[:id])
  end

end
