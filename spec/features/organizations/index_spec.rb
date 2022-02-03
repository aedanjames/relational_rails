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

    it 'displays organization names as links that can navigate to show path' do
        visit "/organizations"
        click_on @organization.name 
        expect(current_path).to eq("/organization/#{@organization.id}")
    end

end 