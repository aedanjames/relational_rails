require 'rails_helper'

RSpec.describe "Organization Fighter's Index" do 
    before :each do 
        @organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @organization_2 = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
        @fighter_1 = @organization_1.fighters.create!(name: "Zelda", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
    end

    it 'displays each fighter that belongs to an organization' do 
        visit "/organizations/#{@organization_1.id}/fighters"
        expect(page).to have_content(@fighter_1.name)
        expect(page).to have_content(@fighter_2.name)
    end

    it 'has a link that can sort fighters in alphabetical order' do 
        visit "organizations/#{@organization_1.id}/fighters" 
        expect(@fighter_1.name).to appear_before(@fighter_2.name)
        click_link "Alphebetize Fighters"
        expect(@fighter_2.name).to appear_before(@fighter_1.name)
    end 

    it 'has a button that can update a fighter' do 
        visit "/organizations/#{@organization_1.id}/fighters"
        expect(page).to have_content("Zelda")
        expect(page).to have_no_content("Rocky")
        click_button "Edit #{@fighter_1.name}"
        fill_in 'name', with: "Rocky"
        click_button "Update Fighter"
        expect(current_path).to eq("/fighters/#{@fighter_1.id}")
        expect(page).to have_content("Rocky")
    end 

    it 'has a form that allows a user to filter results to fighters with :reach > input' do 
        visit "/organizations/#{@organization_1.id}/fighters"
        expect(page).to have_content(@fighter_1.name)
        expect(page).to have_content(@fighter_2.name)
        fill_in "Only return fighters with reach greater than", with: "50" 
        click_button "Filter"
        expect(current_path).to eq("/organizations/#{@organization_1.id}/fighters")
        expect(page).to have_content(@fighter_2.name)
        expect(page).to have_no_content(@fighter_1.name)
    end
end 