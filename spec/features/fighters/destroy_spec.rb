require 'rails_helper'

RSpec.describe 'Delete a fighter' do
    before :each do 
        @organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @fighter_1 = @organization_1.fighters.create!(name: "Zelda", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
    end 
    it 'has a button that can delete a fighter' do 
        visit "/fighters/#{@fighter_1.id}"
        expect(page).to have_content(@fighter_1.name)
        click_button("Delete #{@fighter_1.name}")
        expect(current_path).to eq("/fighters/")
        expect(page).to have_no_content(@fighter_1.name)
    end 
end 