require 'rails_helper'
# As a visitor
# When I visit '/hotel/:id'
# Then I see the hotel with that id including the hotel's attributes:
# - data from each column that is on the hotel table
# When link from ‘/hotel’ is clicked, navigate to ‘/parents/:id

RSpec.describe 'the hotel show page' do
  before :each do
    @hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: @hotel.id)
    @suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: @hotel.id)
    @suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: @hotel.id)
  end

  it 'shows the attributes' do
    visit "/hotel/#{@hotel.id}"
    expect(page).to have_content(@hotel.id)
    expect(page).to have_content(@hotel.name)
    expect(page).to have_content(@hotel.created_at)
    expect(page).to have_content(@hotel.updated_at)
    expect(page).to have_content(@hotel.five_stars)
    expect(page).to have_content(@hotel.year_founded)
  end

# As a visitor
# When I visit a hotel's show page
# I see a count of the number of suites associated with this hotel

#This test passed however there was nothing included in view. We dont know why.
  it 'displays count of suites associated with hotel' do
    visit "/hotel/#{@hotel.id}"
    expect(page).to have_content(@hotel.suite_count)
  end

# As a visitor
# When I visit a parent show page ('/hotel/:id')
# Then I see a link to take me to that hotel's `Suites` page ('/hotel/:id/suites')
  it 'has a link to take me to all the suites that hotel has' do
    visit "/hotel/#{@hotel.id}"
    click_on "All suites"
    expect(current_path).to eq("/hotel/#{@hotel.id}/suites")
  end

end
