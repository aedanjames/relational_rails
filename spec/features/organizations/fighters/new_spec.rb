require 'rails_helper'

RSpec.describe 'Fighter creation' do 
    it 'can send the user to a page where a fighter can be created' do
        organization = Organization.create!(name: "Smellator", year_founded: 1995, president: "Drake Droog", international: true)
        fighter_1 = organization.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        fighter_2 = organization.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
        visit "/organizations/#{organization.id}/fighters"
        click_link("Create Fighter")
        expect(current_path).to eq("/organizations/#{organization.id}/fighters/new")
    end 

    it 'allows the user to input information to create a new fighter' do 
        organization = Organization.create!(name: "Smellator", year_founded: 1995, president: "Drake Droog", international: true)
        visit "/organizations/#{organization.id}/fighters/new"
        fill_in('Name', with: "BJ Penn")
        fill_in('Height', with: "6")
        fill_in('weight', with: "155")
        fill_in('reach', with: "65")
        select "switch", :from => "stance"
        select "false", :from => "active"
        click_button("Create Fighter")
        expect(current_path).to eq("/organizations/#{organization.id}/fighters")
        expect(page).to have_content("BJ Penn")
    end 
end 