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
        @organization = Organization.find(params[:id])
    end 

    def update
        organization = Organization.find(params[:id])
        organization.update(organization_params)
        # redirect_to "/organizations/#{organization.id}"
        redirect_to "/organizations/#{organization.id}"
    end 

private
    def organization_params
        params.permit(:name, :year_founded, :president, :international)
    end 
end 