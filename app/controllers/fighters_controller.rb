class FightersController < ApplicationController
    def index
        @fighters = Fighter.all 
    end

    def show
        @fighter = Fighter.find(params[:id])
    end 

    def update 
    end 
end