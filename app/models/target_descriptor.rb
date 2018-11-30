class TargetDescriptor < ApplicationRecord
  validates :label, presence: true

  belongs_to :detection_target
end
