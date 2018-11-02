class DetectorLocation < ApplicationRecord
  validates :site_id,
            :location_name, presence: true
  validates_length_of :location_name, maximum: 20
  validates_length_of :ownership, maximum: 255
end
