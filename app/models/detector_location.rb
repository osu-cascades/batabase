class DetectorLocation < ApplicationRecord
  validates :sample_unit,
            :location_name, presence: true
  validates_length_of :location_name, maximum: 20
  validates_length_of :land_ownership, :description, maximum: 255

  belongs_to :sample_unit
  belongs_to :geodetic_system, optional: true
  belongs_to :local_habitat
  belongs_to :detection_target, optional: true
  belongs_to :target_descriptor, optional: true

  has_many_attached :images

  def sample_unit_id
    byebug 
    sample_unit.id
  end
end
