require 'rails_helper'

RSpec.describe Fighter, type: :model do 

    describe 'validations' do 
        it {should validate_presence_of :name}
        it {should validate_presence_of :height}
        it {should validate_presence_of :weight}
        it {should validate_presence_of :reach}
        it {should validate_presence_of :stance}
        it {should validate_presence_of :active}
    end 
    describe 'relationship' do 
        it {should belong_to :organization}
    end 
end 
