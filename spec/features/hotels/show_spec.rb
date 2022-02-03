require 'rails_helper'
# As a visitor
# When I visit '/hotel/:id'
# Then I see the hotel with that id including the hotel's attributes:
# - data from each column that is on the hotel table
# When link from ‘/hotel’ is clicked, navigate to ‘/parents/:id

RSpec.describe 'the hotel show page' do
  before :each do
    @hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
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
end
