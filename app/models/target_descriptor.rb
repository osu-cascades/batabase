class TargetDescriptor < ApplicationRecord
  validates :label, presence: true
  belongs_to :detection_target

  def detection_target_label
    detection_target.try(:label)
  end
end
