class Organization < ApplicationRecord
    has_many :fighters
    validates_presence_of :name
    validates_presence_of :year_founded
    validates_presence_of :president
    validates_presence_of :international
end 