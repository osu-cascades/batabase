class SamplingFrequency < ApplicationRecord
  validates :frequency, numericality: { greater_than: 0.0 }
end