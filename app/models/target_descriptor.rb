class TargetDescriptor < ApplicationRecord
  validates :label, presence: true, allow_blank: false
  belongs_to :detection_target
end
