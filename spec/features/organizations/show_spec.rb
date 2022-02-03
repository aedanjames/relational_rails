require 'rails_helper'

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
# When link from ‘/parents’ is clicked, navigate to ‘/parents/:id

RSpec.describe 'the organizations #show page' do
    it 'displays the organization attributes' do 
        organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        # test that route has path and points to controller action
        visit "/organizations/#{organization.id}"
        # Now test for functionality
        expect(page).to have_content(organization.name)
        expect(page).to have_content(organization.id)
        expect(page).to have_content(organization.created_at)
        expect(page).to have_content(organization.updated_at)
        expect(page).to have_content(organization.year_founded)
        expect(page).to have_content(organization.president)
        expect(page).to have_content(organization.international)
    end 

end 