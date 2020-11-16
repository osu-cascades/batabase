class FlexibleSearchesController < ApplicationController
  before_action :set_flexible_search, only: [:show, :edit, :update, :destroy]

  # GET /flexible_searches
  # GET /flexible_searches.json
  def index
    @flexible_searches = FlexibleSearch.all
  end

  # GET /flexible_searches/1
  # GET /flexible_searches/1.json
  def show
  end

  # GET /flexible_searches/new
  def new
    @flexible_search = FlexibleSearch.new
  end

  # GET /flexible_searches/1/edit
  def edit
  end

  # POST /flexible_searches
  # POST /flexible_searches.json
  def create
    @flexible_search = FlexibleSearch.new(flexible_search_params)

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
    # Use callbacks to share common setup or constraints between actions.
    def set_flexible_search
      @flexible_search = FlexibleSearch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flexible_search_params
      params.require(:flexible_search).permit(:name)
    end
end