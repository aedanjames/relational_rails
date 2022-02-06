class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
    end 

    def show
        @organization = Organization.find(params[:id])
    end 

    def new
    end 
    
    def create
        organization = Organization.create(organization_params)
        redirect_to "/organizations/"
    end 

    def edit 
        @artist = Organization.find(params[:id])
    end 

    def organization_params
        params.permit(:name, :year_founded, :president, :international)
    end 
end 