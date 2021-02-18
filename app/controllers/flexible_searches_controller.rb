class FlexibleSearchesController < ApplicationController
  before_action :set_flexible_search, only: [:show, :edit, :update, :destroy]

  # GET /flexible_searches
  # GET /flexible_searches.json
  def index
    @flexible_searches = FlexibleSearch.all
    # @fields = FIELDS
    # @headers = HEADERS
  end

  # GET /flexible_searches/1
  # GET /flexible_searches/1.json
  def show
    @flexible_search = FlexibleSearch.find(params[:id])
    @deployment_start = false
    @so_start = false
    @temp = "search_params = { "
    @flexible_search.searchables.each do |s|

      if belongs_to(s) == "deployment" and @deployment_start == false
        puts "& & & & TABLE & & & &"
        puts belongs_to(s)
        @temp << belongs_to(s)
        @temp << " => ["
        @deployment_start = true
      end
      if @deployment_start == true and @so_start == false
        puts @deployment_start
        @temp << "\""
        @temp << s
        @temp << "\", "
      end
      if belongs_to(s) == "sonobat_output" and @so_start == false
        @temp = @temp [0...-2]
        @temp << " ], sonobat_output => [ "
        @so_start = true
      end
      if belongs_to(s) == "sonobat_output" and @so_start == true
        @temp << "\""
        @temp << s
        @temp << "\", "
      end
    end
    @temp = @temp[0...-2]
    @temp << " ]}"


    puts "****************************"
    puts @temp
    puts "****************************"
  end

  # GET /flexible_searches/new
  def new
    @flexible_search = FlexibleSearch.new
  end

  def results
    @flexible_search = FlexibleSearch.find(params[:id])

    manual_idspp1 = params[:manual_idspp1]
    manual_idspp2 = params[:manual_idspp2]
    night = params[:night]
    #OR functionality
    @sonobat_outputs = SonobatOutput.where(manual_idspp1: manual_idspp1).or(SonobatOutput.where(manual_idspp2: manual_idspp2)).or(SonobatOutput.where(night: night))
    #AND functionality

    #@sonobat_outputs = SonobatOutput.where(manual_idspp1: manual_idspp1)
    #@sonobat_outputs = @sonobat_outputs.where(manual_idspp2: manual_idspp2)
    #@sonobat_outputs = @sonobat_outputs.where(night: night)
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
    @flexible_search.destroy
    respond_to do |format|
      format.html { redirect_to flexible_searches_url, notice: 'Flexible search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def belongs_to(strng)
      if Deployment.column_names().include? strng
          return "deployment"
      elsif SonobatOutput.column_names().include? strng
          return "sonobat_output"
      end
    end

    def set_search_fields

    end


    # Use callbacks to share common setup or constraints between actions.
    def set_flexible_search
      @flexible_search = FlexibleSearch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flexible_search_params
      params.require(:flexible_search).permit(:name, :narrow, :search_field, :search_items, :state, :sample_unit, 
      :location_id, :agency, :night, :manual_idspp1, :manual_idspp2, searchables: [])
    end
end

