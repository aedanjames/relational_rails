class Fighter < ApplicationRecord
    belongs_to :organization
    # validates_presence_of :id
    validates_presence_of :name
    # validates_presence_of :created_at
    # validates_presence_of :updated_at
    validates_presence_of :height
    validates_presence_of :weight
    validates_presence_of :reach
    validates_presence_of :stance
    # validates_presence_of :active
end 