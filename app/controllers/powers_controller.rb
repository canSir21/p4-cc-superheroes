class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    wrap_parameters format: []

    def index 
        render json: Power.all 
    end

    def show
        power = find
        render json: power
    end

    def update
        power = find
        power.update!(power_params)
        render json: power, status: :ok
    end 

    private
    def render_not_found_response
        render json: { error: "Power not found" }, status: :not_found
    end

    def power_params
        params.permit(:name, :description)
    end 
    
    def find
        Power.find(params[:id])
    end 
end
