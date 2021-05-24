class FlexibleSearchesController < ApplicationController
  before_action :set_flexible_search, only: [:show, :edit, :update, :destroy]
  before_action :set_search
  # GET /flexible_searches
  # GET /flexible_searches.json
  def index
    @flexible_searches = ransack_result
    # @fields = FIELDS
    # @headers = HEADERS
  end

  # GET /flexible_searches/1
  # GET /flexible_searches/1.json
  def show
    
  end

  # GET /flexible_searches/new
  def new
  end

  def odfw_form
  end

  def odfw_results
    manual_idspp1 = params[:manual_idspp1]
    manual_idspp2 = params[:manual_idspp2]
    night = params[:night]
    location_name = params[:location_name]
    latitude = params[:latitude]
    longitude = params[:longitude]
    elevation = params[:elevation]
    code = params[:code]
    name = params[:name]
    comments = params[:comments]
    first_name = params[:first_name]
    last_name = params[:last_name]
    organization = params[:organization]
    land_ownership = params[:land_ownership]


    @sonobat_outputs = SonobatOutput.all
    @sonobat_outputs = SonobatOutput.where(manual_idspp1: manual_idspp1) unless manual_idspp1.blank?
    @sonobat_outputs = @sonobat_outputs.where(manual_idspp2: manual_idspp2) unless manual_idspp2.blank?
    @sonobat_outputs = @sonobat_outputs.where(night: night) unless night.blank?
    @sonobat_outputs = @sonobat_outputs.where(location_name: location_name) unless location_name.blank?
    @sonobat_outputs = @sonobat_outputs.where(latitude: latitude) unless latitude.blank?
    @sonobat_outputs = @sonobat_outputs.where(longitude: longitude) unless longitude.blank?
    @sonobat_outputs = @sonobat_outputs.where(elevation: elevation) unless elevation.blank?
    @sonobat_outputs = @sonobat_outputs.where(code: code) unless code.blank?
    @sonobat_outputs = @sonobat_outputs.where(name: name) unless name.blank?
    @sonobat_outputs = @sonobat_outputs.where(comments: comments) unless comments.blank?
    @sonobat_outputs = @sonobat_outputs.where(first_name: first_name) unless first_name.blank?
    @sonobat_outputs = @sonobat_outputs.where(last_name: last_name) unless last_name.blank?
    @sonobat_outputs = @sonobat_outputs.where(organization: organization) unless organization.blank?
    @sonobat_outputs = @sonobat_outputs.where(land_ownership: land_ownership) unless land_ownership.blank?
  end

  def qs_so_form
  end

  def qs_so_results
    manual_idspp1 = params[:manual_idspp1]
    manual_idspp2 = params[:manual_idspp2]
    night = params[:night]
    state = params[:state]
    sample_unit = params[:sample_unit]
    location_identifier = params[:location_identifier]
    agency = params[:agency]
    spp_accp = params[:spp_accp]
    notes = params[:notes]
    code = params[:code]
    grts = params[:grts]
    recording_start = params[:recording_start]
    recording_stop = params[:recording_stop]
    recovery_date = params[:recovery_date]

    #OR functionality
    # @flexible_search = SonobatOutput.where(manual_idspp1: manual_idspp1).or(Deployment.where(microphone_orientation: microphone_orientation))
    #AND functionality
    @sonobat_outputs = SonobatOutput.all
    @sonobat_outputs = SonobatOutput.where(manual_idspp1: manual_idspp1) unless manual_idspp1.blank?
    @sonobat_outputs = @sonobat_outputs.where(manual_idspp2: manual_idspp2) unless manual_idspp2.blank?
    @sonobat_outputs = @sonobat_outputs.where(night: night) unless night.blank?
  end


  # GET /flexible_searches/1/edit
  def edit
    @flexible_search = FlexibleSearch.find(params[:id])
  end

  # POST /flexible_searches
  # POST /flexible_searches.json
  def create
    @flexible_search = FlexibleSearch.new(flexible_search_params)
    @flexible_search.save

    respond_to do |format|
      if @flexible_search.save
        format.html { redirect_to @flexible_search, notice: 'Flexible search was successfully created.' }
        format.json { render :show, status: :created, location: @flexible_search }
      else
        format.html { render :new }
        format.json { render json: @flexible_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flexible_searches/1
  # PATCH/PUT /flexible_searches/1.json
  def update
    respond_to do |format|
      if @flexible_search.update(flexible_search_params)
        format.html { redirect_to @flexible_search, notice: 'Flexible search was successfully updated.' }
        format.json { render :show, status: :ok, location: @flexible_search }
      else
        format.html { render :edit }
        format.json { render json: @flexible_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flexible_searches/1
  # DELETE /flexible_searches/1.json
  def destroy
    # @flexible_search = FlexibleSearch.find(params[:id])
    @flexible_search.destroy
    respond_to do |format|
      format.html { redirect_to flexible_searches_url, notice: 'Flexible search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_1
    @sonobat_outputs = SonobatOutput.where(manual_idspp1: "LACI")

  end

  def search_2
    @sonobat_outputs = SonobatOutput.where(manual_idspp1: "MYCA")
    @sonobat_outputs = @sonobat_outputs.where(manual_idspp2: "EPFULANO")
    @sonobat_outputs = @sonobat_outputs.where(night: "2016-11-07 00:00:00 UTC")
  end

  def alt_search_1
  end

  def parent_t(strng)
    if Deployment.column_names().include? strng
        return "deployment"
    elsif SonobatOutput.column_names().include? strng
        return "sonobat_output"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flexible_search
      @flexible_search = FlexibleSearch.find(params[:id])
    end

    def set_search
      @search = FlexibleSearch.ransack(params[:q])
    end

    def ransack_result
      @search.result.page(params[:page])
    end

    # Only allow a list of trusted parameters through.
    def flexible_search_params
      params.require(:flexible_search).permit(:name, :spp_accp, :comments, :recording_length, :detector_location, :narrow, :search_field, :search_items, :state, :sample_unit, 
      :location_id, :agency, :night, :manual_idspp1, :manual_idspp2, :land_ownership, :organization, :first_name, :last_name, :comments, :code, :elevation, :latitude, :longitude, searchables: [])
    end
end

