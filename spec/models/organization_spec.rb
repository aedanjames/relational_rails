require 'rails_helper'

RSpec.describe Organization, type: :model do 
    before :each do 
        @organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        @organization_2 = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
        @fighter_1 = @organization_1.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        @fighter_2 = @organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
    end 
    describe 'validations' do 
        it {should validate_presence_of :name}
        it {should validate_presence_of :year_founded}
        it {should validate_presence_of :president}
        it {should validate_presence_of :international}
    end 
    
    describe 'relationship' do 
        it {should have_many :fighters}
    end 

    describe 'instance methods' do 
        it '#self.in order' do 
            organization_1_ordered_index = Organization.all.in_order[1]
            organization_2_ordered_index = Organization.all.in_order[0]
            expect(@organization_2).to eq(Organization.all.last)
            expect(organization_2_ordered_index).to eq (Organization.all.in_order.first)
        end

        it '#count_fighters' do 
            organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
            organization_2 = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
            fighter_1 = organization_1.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
            fighter_2 = organization_1.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
            expect(organization_1.count_fighters).to eq(2)
            expect(organization_2.count_fighters).to eq(0)
        end 
    end 
end  

