class Organization < ApplicationRecord
    has_many :fighters, dependent: :destroy
    validates_presence_of :name
    validates_presence_of :year_founded
    validates_presence_of :president
    validates :international, inclusion: [true, false]

    def self.in_order
        order(created_at: :desc)
    end 

    def count_fighters
        Fighter.where(organization_id: self.id).count
    end

    def alphabetical
        fighters.order(:name)
    end 

    def reach_filter(reach)
        fighters.where("reach > ?", reach)
    end
end