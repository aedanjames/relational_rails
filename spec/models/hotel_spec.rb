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
end
