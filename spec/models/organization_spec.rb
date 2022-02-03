require 'rails_helper'

RSpec.describe Organization, type: :model do 
    describe 'instance methods' do 
        it 'has attributes' do 
        organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)

        expect(organization.name).to eq("UFC")
        expect(organization.year_founded).to eq(1995)
        expect(organization.president).to eq("Dana White")
        expect(organization.international).to eq(true)
        end 
    end 
    
    describe 'relationship' do 
        it 'has many fighters' do 
        organization = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
        fighter_1 = organization.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
        fighter_2 = organization.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: false)
        expect(organization.id).to eq(fighter_1.organization_id && fighter_2.organization.id)
        end 
    end
end 