require 'rails_helper'

# As a visitor
# When I visit a organization show page
# Then I see a link to update the organization "Update #{organization.name}"
# When I click the link "Update #{organization.name}"
# Then I am taken to '/organizations/:id/edit' where I  see a form to edit the organization's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/organizations/:id',
# the organization's info is updated,
# and I am redirected to the Organization's Show page where I see the organization's updated info

RSpec.describe 'the organization edit' do 
    it 'links to the edit page' do 
        organization = Organization.create!(name: "Rollie Pollie", year_founded: 1994, president: "Bam Bam", international: true)
        visit '/organizations'
        click_button "Edit #{organization.name}"
        expect(current_path).to eq("/organizations/#{organization.id}/edit")
    end 

    it 'can successfully update an artist' do 
        organization = Organization.create!(name: "Rollie Polli", year_founded: 194, president: "Bam Ba", international: true)
        visit "/organizations"
        expect(page).to have_content("Rollie Polli")
        click_button "Edit Rollie Polli"
        fill_in 'name', with: "Rollie Pollie"
        fill_in 'year_founded', with: "1994"
        fill_in 'president', with: "Bam Bam"
        # capybara selecting true from international dropdown 
        select "true", :from => "international"
        click_button "Update Organization"
        expect(current_path).to eq("/organizations/#{organization.id}")
        expect(page).to have_content("Rollie Pollie")
    end 
end 