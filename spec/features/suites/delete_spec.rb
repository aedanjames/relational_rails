require 'rails_helper'
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child


RSpec.describe 'has button to delete suite' do
    before :each do
      @hotel_1 = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
      @suite_1 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: @hotel_1.id)
      @suite_2 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: @hotel_1.id)
    end

    it 'has a button to delete suites' do

        visit "/suites/#{@suite_1.id}"

        expect(page).to have_content(@suite_1.name)

        click_button("Delete #{@suite_1.name}")

        expect(current_path).to eq("/suites")

        expect(page).to have_no_content(@suite_1.name)
    end
end
