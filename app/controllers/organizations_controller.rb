# Should we do an OrganizationsFightersController instead of just an OrganizationsController? Probably
class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
    end 
end 