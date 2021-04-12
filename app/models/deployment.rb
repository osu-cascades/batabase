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

  accepts_nested_attributes_for :detector

  def self.distance_to_distance_range(distance)
    case distance
    when 0..4
      '< 5m'
    when 5
      '5m'
    when 6..9
      '5-10m'
    when 10
      '10m'
    when 11..14
      '10-15m'
    when 15
      '15m'
    when 16..19
      '15-20m'
    when 20
      '20m'
    when 21..29
      '20-30m'
    when 30..40
      '30-40m'
    when 41..49
      '40-50m'
    when 50
      '50m'
    when 51..60
      '50-60m'
    when 61..70
      '60-70m'
    when 75
      '75m'
    when 71..80
      '70-80m'
    when 81..90
      '80-90m'
    when 100
      '100m'
    when distance > 100
      '> 100m'
    else
      'Unknown'
    end
  end
end
