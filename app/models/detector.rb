class Detector < ApplicationRecord
  validates :code, :serial_num, :manufacturer, presence: true
  validates_length_of :code, maximum: 20
  validates_length_of :serial_num, :model, :manufacturer, :firmware, maximum: 50
end
