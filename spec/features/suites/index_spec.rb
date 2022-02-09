require 'rails_helper'
# As a visitor
# When I visit '/suites'
# Then I see each Suite in the system including the suites's attributes:
RSpec.describe 'Suites Index' do
  before :each do
    hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel.id)
    @suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: hotel.id)
    @suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: hotel.id)
  end

  it 'has attributes' do
    visit "/suites"
    expect(page).to have_content(@suite.name)
    expect(page).to have_content(@suite_1.name)
    expect(page).to have_content(@suite_2.name)
  end

  # As a visitor
  # When I visit the `suites` index page or a hotels `suites` index page
  # Next to every suite, I see a link to edit that suites's info
  # When I click the link
  # I should be taken to that `suite` edit page where I can update its information just like in User Story 11
  it 'can update each suite with button' do
    hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    suite = Suite.create!(name: '11', clean: true, number_of_beds: 4, hotel_id: hotel.id)
    visit "/suites"

    expect(page).to have_content("11")
    # expect(page).to have_no_content("90000")

    click_button "Edit #{@suite.name}"

    expect(current_path).to eq("/suites/#{@suite.id}/edit")
    fill_in 'name', with: "333"
    fill_in 'number_of_beds', with: "2"
    select "false", :from => "clean"

    click_button "Update Suite"

    expect(current_path).to eq("/suites/#{@suite.id}")
    expect(page).to have_content("333")
  end
end
