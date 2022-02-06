require 'rails_helper'
# As a visitor
# When I visit the Organization Index page
# Then I see a link to create a new Organization record, "New Organization"
# When I click this link
# Then I am taken to '/organizations/new' where I  see a form for a new parent record
# When I fill out the form with a new organization's attributes:
# And I click the button "Create Organization" to submit the form
# Then a `POST` request is sent to the '/organizations' route,
# a new organization record is created,
# and I am redirected to the Organization Index page where I see the new Organization displayed.

RSpec.describe 'the Organization creation' do 
    it 'can send the user to a page where an artist can be created' do 
        visit '/organizations/'
        click_link("New Organization")
        # expect(current_path).to eq("/organizations/new")
    end 

    it 'can create a new organization' do 
        # execution
        visit '/organizations/new'
        fill_in('Name', with: "Invicta")
        fill_in('year_founded', with: "2009")
        fill_in('president', with: "Smelly Kelly")
        select "true", :from => "international"
        click_button("Create Organization")
        # expectation
        expect(current_path).to eq("/organizations/")
        expect(page).to have_content("Invicta")
        expect(page).to have_content("Created at:")
    end 
end 