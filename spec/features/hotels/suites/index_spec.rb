require 'rails_helper'
# As a visitor
# When I visit '/hotel/:hotel_id/suites_table_name'
# Then I see each Suite that is associated with that Hotel with each Suites's attributes:

RSpec.describe 'index of suites of hotel' do
  before :each do
    @hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @suite_1 = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: @hotel.id)
    @suite_2 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: @hotel.id)
    @suite_3 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: @hotel.id)
  end

  it 'each suite associated with a hotel' do
    visit "/hotel/#{@hotel.id}/suites"

     expect(page).to have_content(@suite_1.name)
     expect(page).to have_content(@suite_2.name)
     expect(page).to have_content(@suite_3.name)
  end


# As a visitor
# When I visit a Hotel Suite Index page
# Then I see a link to add a new adoptable suite for that hotel "Create Suite"
# When I click the link
# I am taken to '/hotels/:hotel_id/suites/new' where I see a form to add a new adoptable suite
# When I fill in the form with the suites's attributes:
# And I click the button "Create Suite"
# Then a `POST` request is sent to '/hotels/@hotels.id/suites',
# a new suite object/row is created for that hotel,
# and I am redirected to the Hotel Suite Index page where I can see the new suite listed


  it 'has a link to add a new adoptable suite for that hotel "Create Suite"' do
    hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel.id)
    suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: hotel.id)
    suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: hotel.id)

        visit "/hotel/#{hotel.id}"

        save_and_open_page
        click_link 'Create Suite'
        expect(current_path).to eq("/hotels/#{hotel.id}/new")

    end
end
