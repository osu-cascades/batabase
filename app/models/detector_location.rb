# frozen_string_literal: true

class DetectorLocation < ApplicationRecord
  belongs_to :sample_unit
  belongs_to :detection_target
  belongs_to :target_descriptor
  belongs_to :local_habitat

  validates :quad_id, presence: true, allow_blank: false, inclusion: {
    in: ['NW', 'NE', 'SW', 'SE']
  }

  validates :quad_no, presence: true, numericality: { only_integer: true }, inclusion: 1..20

  after_create do
    self.location_id = "#{sample_unit_id}_#{quad_id}#{quad_no}"
  end
end
