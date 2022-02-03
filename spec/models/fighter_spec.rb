require 'rails_helper'

RSpec.describe Fighter, type: :model do 
    describe 'instance methods' do 

        it 'has attributes' do 
            organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
            fighter = organization.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
            expect(fighter.name).to eq("Becky")
            expect(fighter.height).to eq(14.0)
            expect(fighter.weight).to eq(120.0)
            expect(fighter.reach).to eq(36)
            expect(fighter.stance).to eq("orthodox")
            expect(fighter.active).to eq(true)
        end 
    end 
        describe 'relationship' do 
        it {should belong_to :organization}

        it 'belongs to an organization' do 
            organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
            fighter = organization.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
            expect(fighter.organization_id).to eq(organization.id)
        end 

        it 'can only belong to one organization' do 
            organization_1 = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
            organization_2 = Organization.create!(name: "Bellator", year_founded: 2005, president: "Scott Coker", international: true)
            fighter = organization_1.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
            expect(fighter.organization_id).to_not eq(organization_1.id && organization_2.id)
        end 
    end 
end