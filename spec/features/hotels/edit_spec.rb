require 'rails_helper'
# As a visitor
# When I visit a hotel show page
# Then I see a link to update the hotel "Update Hotel"
# When I click the link "Update Hotel"
# Then I am taken to '/hotels/:id/edit' where I see a form to edit the hotel's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/hotels/:id',
# the hotel's info is updated,
# and I am redirected to the Hotel's Show page where I see the hotels's updated info
  RSpec.describe 'the hotel edit' do
  it 'links to the edit page' do
    hotel = Hotel.create!(name: 'Four Seasons', five_stars: true, year_founded: 1990)

    visit '/hotels'

    click_button "Edit #{hotel.name}"

    expect(current_path).to eq("/hotels/#{hotel.id}/edit")
  end

  it 'can edit the hotel' do
    hotel = Hotel.create!(name: 'Four S', five_stars:true, year_founded: 999)

    visit "/hotels"

    expect(page).to have_content('Four S')

    click_button 'Edit Four S'
    fill_in 'name', with: 'Four Seasons'
    fill_in 'five_stars', with: 'true'
    fill_in 'year_founded', with: '1999'
    click_button 'Update Hotel'

    expect(current_path).to eq("/hotels")
    expect(page).to have_content('Four Seasons')

   end
 end
