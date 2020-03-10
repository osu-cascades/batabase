# frozen_string_literal: true

class Deployment < ApplicationRecord
  validates :microphone_height_off_ground, numericality: { greater_than: 0.0 }
  validates :microphone_orientation, allow_nil: false, inclusion: { in: ['', 'N', 'W', 'E', 'S', 'NW', 'NE', 'SW', 'SE'] }
  validates :clutter_percent, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :sampling_frequency, numericality: { only_integer: true }

  belongs_to :sample_unit
  belongs_to :detector
  belongs_to :distance_range
  belongs_to :clutter_type
  belongs_to :primary_contact, class_name: 'Contact'
  belongs_to :recovery_contact, class_name: 'Contact'
end
