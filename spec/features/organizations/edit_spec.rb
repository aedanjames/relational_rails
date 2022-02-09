require 'rails_helper'

RSpec.describe 'the organization edit' do 
    it 'links to the edit page' do 
        organization = Organization.create!(name: "Rollie Pollie", year_founded: 1994, president: "Bam Bam", international: true)
        visit '/organizations'
        click_button "Edit #{organization.name}"
        expect(current_path).to eq("/organizations/#{organization.id}/edit")
    end 

    it 'can successfully update an organization' do 
        organization = Organization.create!(name: "Rollie Polli", year_founded: 194, president: "Bam Ba", international: true)
        visit "/organizations"
        expect(page).to have_content("Rollie Polli")
        click_button "Edit Rollie Polli"
        fill_in 'name', with: "Rollie Pollie"
        fill_in 'year_founded', with: "1994"
        fill_in 'president', with: "Bam Bam"
        select "true", :from => "international"
        click_button "Update Organization"
        expect(current_path).to eq("/organizations/#{organization.id}")
        expect(page).to have_content("Rollie Pollie")
    end 
end 