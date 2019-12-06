class Detector < ApplicationRecord
  validates :manufacturer, presence: true, allow_blank: false
  validates :model, presence: true, allow_blank: false
  validates :owner, presence: true, allow_blank: false, inclusion: { in: [ "ODFW", "NPS", "BLM", "USFS", "OSU", "Other" ] }
  validates :serial_number, presence: true, allow_blank: false
end
