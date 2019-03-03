class DetectorLocation < ApplicationRecord
  validates :sample_unit_id,
            :location_name, presence: true
  validates_length_of :location_name, maximum: 20
  validates_length_of :ownership, :description, maximum: 255

  belongs_to :sample_unit
  
end
