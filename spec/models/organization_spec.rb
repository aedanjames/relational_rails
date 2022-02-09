require 'rails_helper'

RSpec.describe Organization, type: :model do 
    before :each do 
        @organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @organization_2 = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
        @fighter_1 = @organization_1.fighters.create!(name: "Zelda", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
    end 

    describe 'validations' do 
        it {should validate_presence_of :name}
        it {should validate_presence_of :year_founded}
        it {should validate_presence_of :president}
        it {should validate_inclusion_of(:international).in_array([true,false])}
    end 
    
    describe 'relationship' do 
        it {should have_many :fighters}
    end 

    describe 'instance method' do 
        it '#self.in order' do 
            expect(Organization.in_order).to eq([@organization_2, @organization_1])
        end

        it '#count_fighters' do 
            expect(@organization_1.count_fighters).to eq(2)
            expect(@organization_2.count_fighters).to eq(0)
        end 

        it '#alphabetical' do 
            expect(@organization_1.fighters).to eq([@fighter_1, @fighter_2])
            expect(@organization_1.alphabetical).to eq([@fighter_2, @fighter_1])
        end 

        it '#reach_filter' do 
            expect(@organization_1.reach_filter(50)).to eq([@fighter_2])
        end 
    end 
end  

