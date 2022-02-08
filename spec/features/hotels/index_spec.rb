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
    expect(current_path).to eq("/hotels/#{@hotel.id}")
  end

  # it 'displays the link at the top of the page' do
  #   visit '/hotels'
  #
  #   expect(page). to have_link('Hotel Index')
  #     click_on('Hotel Index')
  #     expect(page).to have_current_path('/suites')
  #     #visit "/hotels/#{@hotel.id}"
  #     #expect(page).to have_link('Suites Index')
  # end


  # As a visitor
    # When I visit the Hotel Index page
    # Then I see a link to create a new hotel record, "New Hotel"
    # When I click this link
    # Then I am taken to '/hotel/new' where I  see a form for a new hotel record
    # When I fill out the form with a new hotel's attributes:
    # And I click the button "Create Hotel" to submit the form
    # Then a `POST` request is sent to the '/hotel' route,
    # a new parent record is created,
    # and I am redirected to the Hotel Index page where I see the new Hotel displayed.

    it 'links to the new page from the artist index' do
      visit '/hotels'

      click_link('New Hotel')
      expect(current_path).to eq('/hotels/new')
    end

    it 'can create a new hotel' do
      visit '/hotels/new'

      fill_in('name', with: 'Hilton')
      fill_in('five_stars', with: 'true')
      fill_in('year_founded', with: '1980')
      click_button('Create Hotel')

      # new_hotel_id = Hotel.last.id
      expect(current_path).to eq("/hotels")
      expect(page).to have_content("Hilton")
    end

end
