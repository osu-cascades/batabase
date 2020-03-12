# frozen_string_literal: true

class DetectorLocation < ApplicationRecord
  validates :quad_id, presence: true, allow_blank: false, inclusion: {
    in: ['NW', 'NE', 'SW', 'SE']
  }

  validates :quad_no, allow_nil: true, inclusion: 1..20

  has_many :deployments

  belongs_to :detection_target
  belongs_to :local_habitat
  belongs_to :sample_unit
  belongs_to :target_descriptor

  before_create :set_location_identifier

  private

  def set_location_identifier
    self.location_identifier = "#{sample_unit_id}_#{quad_id}#{quad_no}"
  end
end
