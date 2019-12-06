class RecordingLength < ApplicationRecord
  validates :length, numericality: { greater_than: 0.0 }
end