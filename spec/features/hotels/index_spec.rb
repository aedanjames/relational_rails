require 'rails_helper'
# As a visitor
# When I visit '/hotels'
# Then I see the name of each hotel record in the system
RSpec.describe 'Hotels Index' do
  before :each do
    @hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @suite_2 = Suite.create!(name: 'two', clean: false, number_of_beds: 2, hotel_id: @hotel.id)
    @suite_1 = Suite.create!(name: 'one', clean:false, number_of_beds: 1, hotel_id: @hotel.id)
  end

  it 'displays the name of each hotel' do
    visit "/hotels"
    expect(page).to have_content(@hotel.name)
  end

  it 'displays hotel names as link that navigate to a specific hotel' do
    visit "/hotels"
    first(:link, @hotel.name).click
    # click_on @hotel.name
    # hotel.reload
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

      first(:link, 'New Hotel').click
      # click_link('New Hotel')
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

# As a visitor
# When I visit the Hotel's Suites Index Page
# Then I see a link to sort suites in alphabetical order
# When I click on the link
# I'm taken back to the Hotel's Suites Index Page where I see all of the hotel's suites in alphabetical order

  it 'goes back to the Hotels Suites Index Page where I see all of the hotels suites in alphabetical order' do

    visit "hotels/#{@hotel.id}/suites"

    expect(@suite_2.name).to appear_before(@suite_1.name)

    # first(:link, "Suites in alphabetical order").click
    click_link "Suites in alphabetical order"

    expect(@suite_1.name).to appear_before(@suite_2.name)
  end

end
