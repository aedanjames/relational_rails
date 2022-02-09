require 'rails_helper'

RSpec.describe 'Fighters Show' do 
    before :each do 
        @organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @fighter_1 = @organization.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
    end 
    it "displays a specified fighter's name" do 
        visit "/fighters/#{@fighter_1.id}"
        expect(page).to have_content(@fighter_1.name)
    end 

    it "displays a specified fighter's attributes" do 
        visit "/fighters/#{@fighter_2.id}"
        expect(page).to have_content(@fighter_2.height)
        expect(page).to have_content(@fighter_2.weight)
        expect(page).to have_content(@fighter_2.reach)
        expect(page).to have_content(@fighter_2.stance)
        expect(page).to have_content(@fighter_2.active)
    end 

    it 'has a button to update each fighter' do 
        visit "/fighters/"
        expect(page).to have_content("Becky")
        expect(page).to have_no_content("Benistta")
        click_button "Edit #{@fighter_1.name}"
        expect(current_path).to eq("/fighters/#{@fighter_1.id}/edit")
        fill_in 'name', with: "Benistta"
        click_button "Update Fighter"
        expect(current_path).to eq("/fighters/#{@fighter_1.id}")
        expect(page).to have_content("Benistta")
    end 
end