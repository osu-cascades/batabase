class ListMaintenance::SampleDesignsController < ApplicationController
  before_action :set_sample_design, only: [:edit, :update, :destroy]

  def index
    @sample_designs = SampleDesign.all
  end

  def new
    @sample_design = SampleDesign.new
  end

  def edit; end

  def create
    @sample_design = SampleDesign.new(sample_design_params)
    if @sample_design.save
      redirect_to sample_designs_path
      flash[:success] = 'Sample design was successfully created.'
    else
      render :new
    end
  end

  def update
    if @sample_design.update(sample_design_params)
      redirect_to sample_designs_path
      flash[:success] = 'Sample design was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sample_design.destroy
    redirect_to sample_designs_path
    flash[:success] = 'Sample design was successfully destroyed.'
  end

  private

  def sample_design_params
    params.require(:sample_design).permit(:label, :sample_design_type_id, :description)
  end

  def set_sample_design
    @sample_design = SampleDesign.find(params[:id])
  end

end
