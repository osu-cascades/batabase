# frozen_string_literal: true

class TargetDescriptor < ApplicationRecord
  validates :label, presence: true, allow_blank: false
  belongs_to :detection_target
  has_many :detector_locations
end
