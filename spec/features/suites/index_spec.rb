require 'rails_helper'
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

  it 'can update each suite with button' do
    hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    suite = Suite.create!(name: '11', clean: true, number_of_beds: 4, hotel_id: hotel.id)
    visit "/suites"

    expect(page).to have_content("11")

    click_button "Edit #{@suite.name}"

    expect(current_path).to eq("/suites/#{@suite.id}/edit")

    fill_in 'name', with: "333"
    fill_in 'number_of_beds', with: "2"
    select "false", :from => "clean"

    click_button "Update Suite"

    expect(current_path).to eq("/suites/#{@suite.id}")
    expect(page).to have_content("333")
  end

  it 'can delete suite' do

    visit "/suites"

    expect(page).to have_content(@suite.name)

    click_button "Delete #{@suite.name}"


    expect(page).to have_no_content(@suite.name)
  end
end
