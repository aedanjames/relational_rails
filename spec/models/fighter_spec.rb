require 'rails_helper'

RSpec.describe Fighter, type: :model do 
    before :each do 
        @organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @fighter_1 = @organization_1.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: false)
    end 

    describe 'validations' do 
        it {should validate_presence_of :name}
        it {should validate_presence_of :height}
        it {should validate_presence_of :weight}
        it {should validate_presence_of :reach}
        it {should validate_presence_of :stance}
        it {should validate_inclusion_of(:active).in_array([true,false])}
    end 
    describe 'relationship' do 
        it {should belong_to :organization}
    end 

    describe 'instance method' do 
        it '#is_active' do 
        expect(Fighter.all).to eq([@fighter_1, @fighter_2])
        expect(Fighter.is_active).to eq([@fighter_1])
        end 
    end
end 
