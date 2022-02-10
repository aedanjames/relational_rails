require 'rails_helper'

RSpec.describe 'index of suites of hotel' do
  before :each do
    @hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    @suite_1 = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: @hotel.id)
    @suite_2 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: @hotel.id)
    @suite_3 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: @hotel.id)
  end

  it 'each suite associated with a hotel' do
    visit "/hotels/#{@hotel.id}/suites"

     expect(page).to have_content(@suite_1.name)
     expect(page).to have_content(@suite_2.name)
     expect(page).to have_content(@suite_3.name)
  end

  it 'has a link to add a new adoptable suite for that hotel "Create Suite"' do
    hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel.id)
    suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: hotel.id)
    suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: hotel.id)

        visit "/hotels/#{hotel.id}/suites"

        click_link 'Create Suite'
        
        expect(current_path).to eq("/hotels/#{hotel.id}/suites/new")
    end

    it 'user fills out the form and a new suite is created' do
      hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
      suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel.id)
      suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: hotel.id)
      suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: hotel.id)

        visit "/hotels/#{hotel.id}/suites/new"

        fill_in('name', with: "456")
        select "false", :from => "Clean"
        fill_in('number_of_beds', with: "3")

        click_button("Create Suite")

        expect(current_path).to eq("/hotels/#{hotel.id}/suites")
        expect(page).to have_content("456")
    end

  it 'allows a user to filter rooms greater than a given number' do

    visit "/hotels/#{@hotel.id}/suites"

    expect(page).to have_content(@suite_2.name)

    fill_in "Only return suites with more than", with: "2"

    click_button "Filter"

    expect(current_path).to eq("/hotels/#{@hotel.id}/suites")
    expect(page).to have_content(@suite_1.name)
    expect(page).to have_no_content(@suite_2.name)

  end
end
