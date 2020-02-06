class DetectorLocation < ApplicationRecord
  belongs_to :sample_unit
  belongs_to :detection_target
  belongs_to :target_descriptor
  belongs_to :local_habitat

  validates :quad_id, presence: true, allow_blank: false, inclusion: {
    in: ['NE', 'NW', 'SE', 'SW']
  }

  validates :quad_no, presence: true, inclusion: 1..10

  after_create do
    self.location_id = "#{self.sample_unit_id}_#{self.quad_id}#{self.quad_no}"
  end
end
