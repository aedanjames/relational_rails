class FightersController < ApplicationController
    def index
        @fighters = Fighter.all 
    end

    def show
        @fighter = Fighter.find(params[:id])
    end 

    def edit 
        @fighter = Fighter.find(params[:id])
    end 

    def update
        fighter = Fighter.find(params[:id])
        fighter.update(fighters_params)
        redirect_to "/fighters/#{fighter.id}"
    end 

private
    def fighters_params
        params.permit(:name, :height, :weight, :reach, :stance, :active)
    end 
end