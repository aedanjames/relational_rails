require 'rails_helper'

RSpec.describe 'Organization Delete' do
  before :each do
    @hotel_1 = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @hotel_2 = Hotel.create!(name: "Four seasons", five_stars: true, year_founded: 1990)
    # @suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: @hotel_1.id)
    # @suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: @hotel_2.id)
  end

# As a visitor
# When I visit a hotel show page
# Then I see a link to delete the hotel
# When I click the link "Delete Hotel"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
  it 'has a button to delete hotels' do
    visit "/hotels/#{@hotel_1.id}"
    expect(page).to have_content(@hotel_1.name)

    click_button "Delete #{@hotel_1.name}"
    

    expect(current_path).to eq("/hotels")
          # hotel_1.reload
    expect(page).to have_no_content(@hotel_1.name)
  end
end
