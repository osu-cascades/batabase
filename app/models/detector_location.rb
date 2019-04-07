class DetectorLocation < ApplicationRecord
  validates :sample_unit,
            :location_name, presence: true
  validates_length_of :location_name, maximum: 20
  validates_length_of :ownership, :description, maximum: 255

  belongs_to :sample_unit
  belongs_to :geodetic_system, optional: true
  belongs_to :local_habitat
  belongs_to :detection_target, optional: true
  belongs_to :target_descriptor, optional: true

  def detection_target_label
    detection_target.try(:label)
  end

  def quad_id
    location_name.split('_')[1].match(/[a-zA-Z]{2}/)
  end

  def quad_number
    qn = location_name.split('_')[1].match(/\d{1}/)
    qn.nil? ? '1' : qn
  end

  def sample_unit_id
    sample_unit.id
  end

  def datum
    geodetic_system.nil? ? 'NAD83' : geodetic_system
  end
end
