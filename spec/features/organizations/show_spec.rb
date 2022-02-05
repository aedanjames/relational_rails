require 'rails_helper'

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
# When link from ‘/parents’ is clicked, navigate to ‘/parents/:id

# Need to add test to turn each organization name in '/organizations into a link to "/organizations/#:id"

# does this test need to be broken up to separate attributes or is lumping together all attributes fine?
RSpec.describe 'the organizations #show page' do
    before :each do 
        @organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
    end
    it 'displays the organization attributes' do 
        # test that route has path and points to controller action
        visit "/organization/#{@organization.id}"
        # Now test for functionality
        expect(page).to have_content(@organization.name)
        expect(page).to have_content(@organization.id)
        expect(page).to have_content(@organization.created_at)
        expect(page).to have_content(@organization.updated_at)
        expect(page).to have_content(@organization.year_founded)
        expect(page).to have_content(@organization.president)
        expect(page).to have_content(@organization.international)
    end 
# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

    it 'displays a count of the number of fighters associated with this organization' do 
        visit "/organization/#{@organization.id}"
        expect(page).to have_content(@organization.count_fighters)
    end 

    it 'has a link that takes the user to fighters index' do
        visit "/organization/#{@organization.id}"
        click_on "Fighters"
        expect(current_path).to eq("/fighters")
    end

end 