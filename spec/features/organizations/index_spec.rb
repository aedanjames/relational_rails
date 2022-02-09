require 'rails_helper'

RSpec.describe 'Organizations Index' do 
    before :each do 
        @organization_1 = Organization.create!(name: "Punchy Punch", year_founded: 1995, president: "Dana White", international: true)
        @organization_2 = Organization.create!(name: "Smellator", year_founded: 2002, president: "Scott Coker", international: true)
    end 

    it 'displays the name of each organization' do 
        visit "/organizations"
        expect(page).to have_content(@organization_1.name)
        expect(page).to have_content(@organization_2.name)
    end 

    it 'displays organization names as links that can navigate to show path' do
        visit "/organizations"
        click_on @organization_1.name 
        expect(current_path).to eq("/organizations/#{@organization_1.id}")
    end

    it 'displays organizations in order by most recently created' do 
        visit "/organizations"
        expect(@organization_2.name).to appear_before(@organization_1.name)
    end 

    it 'has a link that takes the user to fighters index' do
        visit "/organizations"
        click_on "Fighters"
        expect(current_path).to eq("/fighters")
    end

    it 'has a button to delete an organization' do 
        visit "/organizations"
        expect(page).to have_content("#{@organization_1.name}")
        click_on "Delete #{@organization_1.name}"
        expect(current_path).to eq("/organizations/")
        expect(page).to have_no_content("#{@organization_1.name}")
    end 
end 