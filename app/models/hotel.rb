class Hotel < ApplicationRecord
   has_many :suites
   validates_presence_of :name
   validates_presence_of :five_stars
   validates_presence_of :year_founded
end
