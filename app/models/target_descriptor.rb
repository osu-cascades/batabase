class TargetDescriptor < ApplicationRecord
  validates :label, presence: true

  def detection_target_label
    detection_target.try(:label)
  end
end
