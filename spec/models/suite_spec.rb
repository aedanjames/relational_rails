require 'rails_helper'

RSpec.describe Suite do
  describe 'validations' do
    it { should validate_presence_of :name }
    # it { should validate_presence_of :clean }
    it { should validate_presence_of :number_of_beds }

  end

  describe 'relationship' do
    it { should belong_to :hotel }
  end

# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`

describe 'show records where clean is true' do

    it 'clean is true' do
      Suite.destroy_all
      hotel = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
      suite = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel.id)
      suite_1 = Suite.create!(name: '123', clean:false, number_of_beds: 1, hotel_id: hotel.id)
      suite_2 = Suite.create!(name: '145', clean: false, number_of_beds: 2, hotel_id: hotel.id)

      expect(Suite.is_clean).to eq([suite])

    end
  end
end
