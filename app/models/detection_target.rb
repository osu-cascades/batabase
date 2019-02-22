class DetectionTarget < ApplicationRecord
  has_many :target_descriptors
  validates :label, presence: true

end
