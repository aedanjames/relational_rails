require 'rails_helper'

RSpec.describe 'the Organization creation' do 
    it 'can send the user to a page where an artist can be created' do 
        visit '/organizations/'
        click_link("New Organization")
        expect(current_path).to eq("/organizations/new")
    end 

    it 'can create a new organization' do 
        visit '/organizations/new'
        fill_in('Name', with: "Invicta")
        fill_in('year_founded', with: "2009")
        fill_in('president', with: "Smelly Kelly")
        select "true", :from => "international"
        click_button("Create Organization")
        expect(current_path).to eq("/organizations/")
        expect(page).to have_content("Invicta")
        expect(page).to have_content("Created at:")
    end 
end 