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
