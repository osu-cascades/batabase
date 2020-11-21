class LocationMappingsController < ApplicationController
  before_action :set_location_mapping, only: [:show, :edit, :update, :destroy]

  FIELDS = [
    [:detector_location, :location_identifier],
    [:detector_location, :land_ownership]
  ].freeze

  HEADERS = [
    'Location Identifier',
    'Agency'
  ].freeze

  # GET /location_mappings
  # GET /location_mappings.json
  def index
    @fields = FIELDS
    @headers = HEADERS
    @helpers = helpers
    @search = ransack_params
    @location_mappings = ransack_result
  end

  # GET /location_mappings/1
  # GET /location_mappings/1.json
  def show
  end

  # GET /location_mappings/new
  def new
    @location_mapping = LocationMapping.new
  end

  # GET /location_mappings/1/edit
  def edit
  end

  # POST /location_mappings
  # POST /location_mappings.json
  def create
    @location_mapping = LocationMapping.new(location_mapping_params)

    respond_to do |format|
      if @location_mapping.save
        format.html { redirect_to @location_mapping, notice: 'Location mapping was successfully created.' }
        format.json { render :show, status: :created, location: @location_mapping }
      else
        format.html { render :new }
        format.json { render json: @location_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_mappings/1
  # PATCH/PUT /location_mappings/1.json
  def update
    respond_to do |format|
      if @location_mapping.update(location_mapping_params)
        format.html { redirect_to @location_mapping, notice: 'Location mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_mapping }
      else
        format.html { render :edit }
        format.json { render json: @location_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_mappings/1
  # DELETE /location_mappings/1.json
  def destroy
    @location_mapping.destroy
    respond_to do |format|
      format.html { redirect_to location_mappings_url, notice: 'Location mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_mapping
      @location_mapping = LocationMapping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_mapping_params
      params.require(:location_mapping).permit(:name)
    end

    def ransack_params
      LocationMapping.includes(:detector_location).ransack(params[:q])
    end
  
    def ransack_result
      @search.result.page(params[:page])
    end
end
