require 'rails_helper'
# As a visitor
# When I visit '/hotels'
# Then I see the name of each hotel record in the system
RSpec.describe 'Hotels Index' do
  before :each do
    @hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
  end

  it 'displays the name of each hotel' do
    visit "/hotels"
    expect(page).to have_content(@hotel.name)
  end

  it 'displays hotel names as link that navigate to a specific hotel' do
    visit "/hotels"
    click_on @hotel.name
    expect(current_path).to eq("/hotel/#{@hotel.id}")
  end

  # it 'displays the link at the top of the page' do
  #   visit '/hotels'
  #
  #   expect(page). to have_link('Chef Index')
  #     click_on('Chef Index')
  #     expect(page).to have_current_path('/suites')
  #     #visit "/chefs/#{@hotel.id}"
  #     #expect(page).to have_link('Suites Index')
  # end

  
end
