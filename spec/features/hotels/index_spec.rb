require 'rails_helper'

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

    expect(current_path).to eq("/hotels/#{@hotel.id}")
  end


    it 'links to the new page from the hotels index' do
      visit '/hotels'

      first(:link, 'New Hotel').click

      expect(current_path).to eq('/hotels/new')
    end

    it 'can create a new hotel' do
      visit '/hotels/new'

      fill_in('name', with: 'Hilton')
      fill_in('five_stars', with: 'true')
      fill_in('year_founded', with: '1980')

      click_button('Create Hotel')

      expect(current_path).to eq("/hotels")
      expect(page).to have_content("Hilton")
    end


  it 'goes back to the Hotels Suites Index Page where I see all of the hotels suites in alphabetical order' do

    visit "hotels/#{@hotel.id}/suites"

    expect(@suite_2.name).to appear_before(@suite_1.name)

    click_link "Suites in alphabetical order"

    expect(@suite_1.name).to appear_before(@suite_2.name)
  end


  it 'has an edit button to edit a hotel' do
    visit '/hotels/'

    expect(page).to have_content("Taj Mahal")

    page.has_button?("Edit #{@hotel.name}")

    click_button("Edit #{@hotel.name}")

    expect(current_path).to eq("/hotels/#{@hotel.id}/edit")


  end

  it 'can delete a hotel' do

    visit "/hotels"

    expect(page).to have_content(@hotel.name)

    click_button "Delete #{@hotel.name}"

    expect(page).to have_no_content(@hotel.name)
  end
end
