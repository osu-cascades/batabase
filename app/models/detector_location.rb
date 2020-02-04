class DetectorLocation < ApplicationRecord
  belongs_to :sample_unit
  validates :quad_id, presence: true, allow_blank: false, inclusion: {
    in: ['NE', 'NW', 'SE', 'SW']
  }
  validates :quad_no, presence: true, inclusion: 1..10
  
end
