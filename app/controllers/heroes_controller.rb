class HeroesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        heroes = Hero.all
        render json: heroes, include: ['powers']
    end
    def show
        hero = Hero.find(params[:id])
        render json: hero, include: ['powers']
    end

    def create 
        hero = Hero.create(name: params[:name], super_name: params[:super_name])
        render json: hero, status: :created
    end

    private

    def render_not_found_response
      render json: { error: "Hero not found" }, status: :not_found
    end

end
