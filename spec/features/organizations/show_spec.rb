require 'rails_helper'

RSpec.describe 'the organizations #show page' do
    before :each do 
        @organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
    end
    it 'displays the organization attributes' do 
        visit "/organizations/#{@organization.id}"
        expect(page).to have_content(@organization.name)
        expect(page).to have_content(@organization.id)
        expect(page).to have_content(@organization.created_at)
        expect(page).to have_content(@organization.updated_at)
        expect(page).to have_content(@organization.year_founded)
        expect(page).to have_content(@organization.president)
        expect(page).to have_content(@organization.international)
    end 

    it 'displays a count of the number of fighters associated with this organization' do 
        visit "/organizations/#{@organization.id}"
        expect(page).to have_content(@organization.count_fighters)
    end 

    it 'has a link that takes the user to fighters index' do
        visit "/organizations/#{@organization.id}"
        click_on "Fighters"
        expect(current_path).to eq("/fighters")
    end

    it 'has a link that takes the user to that organizations fighters page' do
        visit "/organizations/#{@organization.id}"
        click_on "List of fighters"
        expect(current_path).to eq("/organizations/#{@organization.id}/fighters")
    end

    it 'has a button that allows a user to edit an organization' do 
        visit '/organizations/'
        expect(page).to have_content("UFC")
        click_button "Edit #{@organization.name}"
        expect(current_path).to eq("/organizations/#{@organization.id}/edit")
        fill_in 'name', with: "Rollie Pollie"
        fill_in 'year_founded', with: "1994"
        fill_in 'president', with: "Bam Bam"
        select "true", :from => "international"
        click_button "Update Organization"
        expect(current_path).to eq("/organizations/#{@organization.id}")
        expect(page).to have_content("Rollie Pollie")
    end 
end 