class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create 
        hero_power = HeroPower.create!(hero_powers_params)
        render json: hero_power, include: ['powers']
    end

   
    private 

    def hero_powers_params
        params.permit(:strength, :power_id, :hero_id)
    end

end
