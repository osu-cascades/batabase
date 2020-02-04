class DetectorLocation < ApplicationRecord
  belongs_to :sample_unit
  belongs_to :detection_target
  belongs_to :target_descriptor

  validates :quad_id, presence: true, allow_blank: false, inclusion: {
    in: ['NE', 'NW', 'SE', 'SW']
  }
  validates :quad_no, presence: true, inclusion: 1..10

end
