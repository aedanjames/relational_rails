class OrganizationFightersController < ApplicationController
    def index 
        @organization = Organization.find(params[:id])
        @fighters = @organization.fighters
    end 
end 