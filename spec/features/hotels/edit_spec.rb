require 'rails_helper'

  RSpec.describe 'the hotel edit' do
  it 'links to the edit page' do
    hotel = Hotel.create!(name: 'Four Seasons', five_stars: true, year_founded: 1990)

    visit '/hotels'

    click_button "Edit #{hotel.name}"

    expect(current_path).to eq("/hotels/#{hotel.id}/edit")
  end

  it 'can edit the hotel' do
    hotel = Hotel.create!(name: 'Four S', year_founded: 999, five_stars:true)

    visit "/hotels"

    expect(page).to have_content('Four S')

    click_button 'Edit Four S'
    
    fill_in 'name', with: 'Four Seasons'
    fill_in 'year_founded', with: '1999'
    select "true", :from => "five_stars"

    click_button 'Update Hotel'

    expect(current_path).to eq("/hotels")
    expect(page).to have_content('Four Seasons')

   end
 end
