class RansackQueriesController < ApplicationController

    def index
        @ransack_queries = RansackQuery.all
    end

    def new
        @ransack_query = RansackQuery.new
    end

    def show
        @ransack_query = RansackQuery.find(params[:id])
    end

    def create
        @ransack_query = RansackQuery.new(ransack_query_params)

        if @ransack_query.save
            redirect_to @ransack_query
        else
            render :new
        end
    end

    def edit
        @ransack_query = RansackQuery.find(params[:id])
    end

    def update
    end

    def destroy
    end

    private

    def ransack_query_params
        params.require(:ransack_query).permit(:name, :q)
    end
end