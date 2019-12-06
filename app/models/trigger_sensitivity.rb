class TriggerSensitivity < ApplicationRecord
  validates :sensitivity, presence: true, allow_blank: false, inclusion: { in: [ "VERY LOW", "LOW", "MED", "HIGH", "VERY HIGH" ] }
end
