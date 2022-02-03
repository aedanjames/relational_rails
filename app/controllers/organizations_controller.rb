# Should we do an OrganizationsFightersController instead of just an OrganizationsController? Probably
class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
    end 

    def show
        @organization = Organization.find(params[:id])
    end 
end 