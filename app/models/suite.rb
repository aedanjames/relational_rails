class Suite < ApplicationRecord
  belongs_to :hotel
  validates_presence_of :name
  validates_presence_of :clean
  validates_presence_of :number_of_beds

end
