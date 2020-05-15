# frozen_string_literal: true

class Deployment < ApplicationRecord
  validates :microphone_height_off_ground, numericality: { greater_than: 0.0 }
  validates :microphone_orientation, allow_nil: false, inclusion: { in: ['', 'N', 'W', 'E', 'S', 'NW', 'NE', 'SW', 'SE', 'Vertical'] }
  validates :sampling_frequency, numericality: { only_integer: true }

  belongs_to :detector_location
  belongs_to :detector
  belongs_to :distance_range
  belongs_to :clutter_type
  belongs_to :clutter_percent
  belongs_to :primary_contact, class_name: 'Contact'
  belongs_to :recovery_contact, class_name: 'Contact'

  has_many :sonobat_outputs
end
