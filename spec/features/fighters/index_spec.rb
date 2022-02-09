require 'rails_helper'

# As a visitor
# When I visit '/fighters'
# Then I see each fighter in the system including the fighter's attributes

RSpec.describe 'Fighters Index' do 
    before :each do 
        @organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @fighter_1 = @organization.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization.fighters.create!(name: "Popeye", height: 3.0, weight:180.0, reach: 72, stance: "switch", active: false)
        @fighter_3 = @organization.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: false)
    end 
    it "displays every fighter's name" do 
        visit '/fighters'
        expect(page).to have_content(@fighter_1.name)
    end 

    it "displays every fighter's attributes" do 
        visit '/fighters'
        expect(page).to have_content(@fighter_1.height)
        expect(page).to have_content(@fighter_1.weight)
        expect(page).to have_content(@fighter_1.reach)
        expect(page).to have_content(@fighter_1.stance)
        expect(page).to have_content(@fighter_1.active)
    end 

    it 'only displays fighters that are not active' do
        visit '/fighters'
        expect(page).to have_content(@fighter_1.name)
        expect(page).to have_no_content(@fighter_2.name)
        expect(page).to have_no_content(@fighter_3.name)
    end 

    it 'has a button that the deletes a fighter' do 
        visit '/fighters'
        expect(page).to have_content(@fighter_1.name)
        click_button "Delete #{@fighter_1.name}"
        expect(current_path).to eq("/fighters/")
        expect(page).to have_no_content(@fighter_1.name)
    end 
end 