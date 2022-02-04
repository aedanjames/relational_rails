require 'rails_helper'

RSpec.describe Organization, type: :model do 
    describe 'validations' do 
        it {should validate_presence_of :name}
        it {should validate_presence_of :year_founded}
        it {should validate_presence_of :president}
        it {should validate_presence_of :international}
    end 
    
    describe 'relationship' do 
        it {should have_many :fighters}
    end 
end 