module Api
  class AgenciesController < ApplicationController
    # GET /agencies.json
    def index
      @agencies = Agency.includes(:tags).all
    end

    # POST /agencies.json
    def create
      @agency = Agency.new(agency_params)

      if @agency.save
        render json: @agency, status: :created
      else
        render json: @agency.errors, status: :unprocessable_entity
      end
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_params
      params.require(:agency).permit(:name, :description, :grade, :tag_list)
    end
  end
end
