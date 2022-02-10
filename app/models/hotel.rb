class Hotel < ApplicationRecord
   has_many :suites, dependent: :destroy
   validates_presence_of :name
   # validates_presence_of :five_stars
   validates_presence_of :year_founded

   def self.in_order
     Hotel.order(created_at: :desc)
   end

   def suite_count
     Suite.where(hotel_id: self.id).count
   end

   def alphabetical
     suites.order(:name)
   end

   def room_filter(room_count)
     suites.where("number_of_beds > ?", room_count)
   end
end
