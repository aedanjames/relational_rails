require 'rails_helper'

RSpec.describe Suite do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :clean }
    it { should validate_presence_of :number_of_beds }

  end

  describe 'relationship' do
    it { should belong_to :hotel }
  end
end
