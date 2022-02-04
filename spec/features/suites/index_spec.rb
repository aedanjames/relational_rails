require 'rails_helper'
# As a visitor
# When I visit '/suites'
# Then I see each Suite in the system including the suites's attributes:
RSpec.describe 'Suites Index' do
  before :each do
    hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel.id)
    @suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: hotel.id)
    @suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: hotel.id)
  end

  it 'has attributes' do
    visit "/suites"
    expect(page).to have_content(@suite.name)
    expect(page).to have_content(@suite_1.name)
    expect(page).to have_content(@suite_2.name)
  end
end
