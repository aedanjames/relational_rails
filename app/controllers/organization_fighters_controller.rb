class OrganizationFightersController < ApplicationController
    def index 
        @organization = Organization.find(params[:id])
        if params[:sort]
            @fighters = @organization.alphabetical
        else
            @fighters = @organization.fighters
        end
    end 

    def new
        @organization = Organization.find(params[:id])
    end 

    def create 
        organization = Organization.find(params[:id])
        fighter = organization.fighters.create!(fighter_params)
        redirect_to "/organizations/#{organization.id}/fighters"
    end 

private
    def fighter_params
        params.permit(:name, :height, :weight, :reach, :stance, :active)
    end 
end 