class DetectionTarget < ApplicationRecord
  validates :label, presence: true
end
