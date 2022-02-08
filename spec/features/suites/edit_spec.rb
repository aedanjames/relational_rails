require 'rails_helper'
# As a visitor
# When I visit a Suite Show page
# Then I see a link to update that Suite "Update Suite"
# When I click the link
# I am taken to '/suites/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe 'Update Suite' do
  it 'User can see a link to update that Suite "Update Suite"' do
  hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
  suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel.id)
  

    visit "/suites/#{suite.id}"

    click_link('Update Suite')
    expect(current_path).to eq("/suites/#{suite.id}/edit")

  end

  it '' do
    hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
    suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel.id)


    visit "/suites/#{suite.id}/edit"

    fill_in "Name", with: "678"
    fill_in "Clean", with: "true"
    fill_in "Number of beds", with: "4"
    click_button "Update Suite"
    expect(current_path).to eq("/suites/#{suite.id}")
    suite.reload
    expect(suite.name).to eq("678")
    expect(suite.clean).to eq(true)
    expect(suite.number_of_beds).to eq(4)

  end

 end
