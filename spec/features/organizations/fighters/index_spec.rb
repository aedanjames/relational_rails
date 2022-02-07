require 'rails_helper'

# As a visitor
# When I visit '/organization/:id/fighters'
# Then I see each fighter that is associated with that organization with each fighter's attributes:

RSpec.describe "Organization Fighter's Index" do 
    before :each do 
        @organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @organization_2 = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
        @fighter_1 = @organization_1.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
    end

    it 'displays each fighter that belongs to an organization' do 
        visit "organizations/#{@organization_1.id}/fighters" 
        expect(page).to have_content(@fighter_1.name)
        expect(page).to have_content(@fighter_2.name)
    end
    
# As a visitor
# When I visit a Organization Fighters Index page
# Then I see a link to add a new adoptable fighter for that parent "Create Fighter"
# When I click the link
# I am taken to '/organizations/:organization_id/fighters/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/organizations/@organization.id/fighters',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
    it 'can send the user to a page where a fighter can be created' do
        organization = Organization.create!(name: "Smellator", year_founded: 1995, president: "Drake Droog", international: true)
        fighter_1 = organization.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        fighter_2 = organization.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
        visit "/organizations/#{organization.id}/fighters"
        click_link("Create Fighter")
        expect(current_path).to eq("/organizations/#{organization.id}/fighters/new")
    end 

    it 'allows the user to input information to create a new fighter' do 
        organization = Organization.create!(name: "Smellator", year_founded: 1995, president: "Drake Droog", international: true)
        visit "/organizations/#{organization.id}/fighters/new"
        fill_in('Name', with: "BJ Penn")
        fill_in('Height', with: "6")
        fill_in('weight', with: "155")
        fill_in('reach', with: "65")
        select "switch", :from => "stance"
        select "false", :from => "active"
        click_button("Create Fighter")
        expect(current_path).to eq("/organizations/#{organization.id}/fighters")
        expect(page).to have_content("BJ Penn")
    end 
end 