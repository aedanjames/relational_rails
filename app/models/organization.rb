class Organization < ApplicationRecord
    has_many :fighters
    validates_presence_of :name
    validates_presence_of :year_founded
    validates_presence_of :president
    # validates_presence_of :international

    def self.in_order
        order(created_at: :desc)
    end 

    def count_fighters
        Fighter.where(organization_id: self.id).count
    end
end