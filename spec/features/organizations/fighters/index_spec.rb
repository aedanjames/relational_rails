require 'rails_helper'

# As a visitor
# When I visit '/organization/:id/fighters'
# Then I see each fighter that is associated with that organization with each fighter's attributes:

RSpec.describe "Organization Fighter's Index" do 
    before :each do 
        @organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @organization_2 = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
        @fighter_1 = @organization_1.fighters.create!(name: "Zelda", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
    end

    it 'displays each fighter that belongs to an organization' do 
        visit "organizations/#{@organization_1.id}/fighters" 
        expect(page).to have_content(@fighter_1.name)
        expect(page).to have_content(@fighter_2.name)
    end

    it 'has a link that can sort fighters in alphabetical order' do 
        visit "organizations/#{@organization_1.id}/fighters" 
        expect(@fighter_1.name).to appear_before(@fighter_2.name)
        click_link "Alphebetize Fighters"
        expect(@fighter_2.name).to appear_before(@fighter_1.name)
    end 
end 