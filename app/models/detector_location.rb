class DetectorLocation < ApplicationRecord
  validates :sample_unit,
            :location_name, presence: true
  validates_length_of :location_name, maximum: 20
  validates_length_of :ownership, :description, maximum: 255

  belongs_to :sample_unit
  belongs_to :local_habitat
  belongs_to :detection_target, optional: true

  def detection_target_label
    detection_target.try(:label)
  end
end
