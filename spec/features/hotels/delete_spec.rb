require 'rails_helper'

RSpec.describe 'Organization Delete' do
  before :each do
    @hotel_1 = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @hotel_2 = Hotel.create!(name: "Four seasons", five_stars: true, year_founded: 1990)

  end


  it 'has a button to delete hotels' do
    visit "/hotels/#{@hotel_1.id}"

    expect(page).to have_content(@hotel_1.name)

    click_button "Delete #{@hotel_1.name}"

    expect(current_path).to eq("/hotels")

    expect(page).to have_no_content(@hotel_1.name)
  end
end
