class Detector < ApplicationRecord
  validates :serial_num, :manufacturer, presence: true
  validates_length_of :serial_num, :model, :manufacturer, :firmware, maximum: 50
end
