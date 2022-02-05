require 'rails_helper'
# As a visitor
# When I visit '/organizations' 
# Then I see the name of each organization record in the system
RSpec.describe 'Organizations Index' do 
    before :each do 
        @organization_1 = Organization.create!(name: "Punchy Punch", year_founded: 1995, president: "Dana White", international: true)
        @organization_2 = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
    end 

    it 'displays the name of each organization' do 
        visit "/organizations"
        expect(page).to have_content(@organization_1.name)
        expect(page).to have_content(@organization_2.name)
    end 

    it 'displays organization names as links that can navigate to show path' do
        visit "/organizations"
        click_on @organization_1.name 
        expect(current_path).to eq("/organization/#{@organization_1.id}")
    end
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

# Working but need to figure out how to test for this. Tried and got stuck. Installed orderly gem 
    it 'displays organizations in order by most recently created' do 
        visit "/organizations"
        expect(@organization_2.name).to appear_before(@organization_1.name)
    end 

    it 'displays organization names as links that can navigate to show path' do
        visit "/organizations"
        click_on "Fighters"
        expect(current_path).to eq("/fighters")
    end
end 