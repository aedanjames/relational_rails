require 'rails_helper'

RSpec.describe 'Organization Delete' do 
    before :each do 
        @organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @organization_2 = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
        @fighter_1 = @organization_1.fighters.create!(name: "Zelda", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
        @fighter_3 = @organization_2.fighters.create!(name: "Smartie Dartie", height: 4.2, weight:200.0, reach: 80, stance: "switch", active: false)

    end  
    it 'has a button to delete each organization' do 
        visit "/organizations/#{@organization_1.id}/"
        expect(page).to have_content(@organization_1.name)
        click_button "Delete #{@organization_1.name}"
        expect(current_path).to eq("/organizations/")
        expect(page).to have_no_content(@organization_1.name)
    end 
end 
