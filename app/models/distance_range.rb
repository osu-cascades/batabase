class DistanceRange < ApplicationRecord
  validates :label, presence: true
  validates_length_of :label, maximum: 50
end
