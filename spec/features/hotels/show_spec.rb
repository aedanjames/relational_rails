require 'rails_helper'

RSpec.describe 'the hotel show page' do
  before :each do
    @hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: @hotel.id)
    @suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: @hotel.id)
    @suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: @hotel.id)
  end

  it 'shows the attributes' do
    visit "/hotels/#{@hotel.id}"
    expect(page).to have_content(@hotel.id)
    expect(page).to have_content(@hotel.name)
    expect(page).to have_content(@hotel.created_at)
    expect(page).to have_content(@hotel.updated_at)
    expect(page).to have_content(@hotel.five_stars)
    expect(page).to have_content(@hotel.year_founded)
  end

  it 'displays count of suites associated with hotel' do
    visit "/hotels/#{@hotel.id}"
    expect(page).to have_content(@hotel.suite_count)
  end

  it 'has a link to take me to all the suites that hotel has' do
    visit "/hotels/#{@hotel.id}"
    click_on "All suites"
    expect(current_path).to eq("/hotels/#{@hotel.id}/suites")
  end
end
