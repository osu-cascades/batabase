class DetectionTarget < ApplicationRecord
  belongs_to :target_descriptors
  validates :label, presence: true

end
