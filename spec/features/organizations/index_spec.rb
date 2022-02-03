require 'rails_helper'
# As a visitor
# When I visit '/organizations' 
# Then I see the name of each organization record in the system
RSpec.describe 'Organizations Index' do 
    before :each do 
        @organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
    end 

    it 'displays the name of each organization' do 
        visit "/organizations"
        expect(page).to have_content(@organization.name)
    end 

end 