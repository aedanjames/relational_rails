require 'rails_helper'

RSpec.describe Hotel do
  describe 'instance methods' do
    it 'has attributes' do
    hotel = Hotel.create!(name:'Hilton', five_stars: true, year_founded: 1996)

    expect(hotel.name).to eq('Hilton')
    #expect(hotel.created_at).to be()
    expect(hotel.year_founded).to eq(1996)
    expect(hotel.five_stars).to eq(true)
    # it { should have_many(:suites) }
    end

    it 'has attributes' do
    hotel = Hotel.create!(name:'Hilton', five_stars: true, year_founded: 1996)
    suite = hotel.suites.create!(name:'111', clean: true, number_of_beds: 2)
    expect(suite.name).to eq('111')
    #expect(hotel.created_at).to be()
    expect(suite.clean).to eq(true)
    expect(suite.number_of_beds).to eq(2)
    # it { should have_many(:suites) }
    end

    describe 'relationship' do
    it 'a suite belongs to a hotel' do
      hotel = Hotel.create!(name:'Hilton', five_stars: true, year_founded: 1996)
      suite = hotel.suites.create!(name:'111', clean: true, number_of_beds: 2)
      expect(hotel.id).to eq(suite.hotel_id)
    end

    it 'two suites belong to a hotel' do
      hotel = Hotel.create!(name:'Hilton', five_stars: true, year_founded: 1996)
      suite1 = hotel.suites.create!(name:'111', clean: true, number_of_beds: 2)
      suite2 = hotel.suites.create!(name:'134', clean: false, number_of_beds: 3)
      expect(hotel.id).to eq(suite1.hotel_id && suite2.hotel_id)
      end

      it 'one suite can not belong to two hotels' do
        hotel1 = Hotel.create!(name:'Hilton', five_stars: true, year_founded: 1996)
        hotel2 = Hotel.create!(name:'Four Seasons', five_stars: false, year_founded: 1986)
        suite1 = hotel1.suites.create!(name:'111', clean: true, number_of_beds: 2)    
        expect(suite1.hotel_id).to_not eq(hotel2.id)
      end
    end
  end
end
