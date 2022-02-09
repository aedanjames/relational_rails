class Fighter < ApplicationRecord
    belongs_to :organization
    validates_presence_of :name
    validates_presence_of :height
    validates_presence_of :weight
    validates_presence_of :reach
    validates_presence_of :stance
    validates :active, inclusion: [true, false]

    def self.is_active 
        where(active: true)
    end 
end 