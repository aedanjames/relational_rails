require 'rails_helper'

RSpec.describe Hotel do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :five_stars }
    it { should validate_presence_of :year_founded }
    end

    describe 'relationships' do
      it { should have_many :suites }
    end

    describe 'instance methods' do
      it 'counts suites' do
        hotel_1 = Hotel.create!(name: "Taj Mahal", five_stars: true, year_founded: 1930)
        hotel_2 = Hotel.create!(name: "Hilton", five_stars: true, year_founded: 1960)
        suite_1 = Suite.create!(name: '111', clean: true, number_of_beds: 4, hotel_id: hotel_1.id)
        suite_2 = Suite.create!(name: '123', clean: true, number_of_beds: 1, hotel_id: hotel_2.id)
        suite_3 = Suite.create!(name: '145', clean: true, number_of_beds: 2, hotel_id: hotel_2.id)

        expect(hotel_1.suite_count).to eq(1)
        expect(hotel_2.suite_count).to eq(2)
      end
    end
end
