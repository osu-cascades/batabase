class SampleUnit < ApplicationRecord
  validates :site_code, presence: true
  validates_length_of :site_code, maximum: 20
  validates_length_of :agency, maximum: 50

  has_many :detector_locations
  belongs_to :broad_habitat

  has_many :sample_unit_states
  has_many :states, through: :sample_unit_states
  has_many :sample_unit_counties
  has_many :counties, through: :sample_unit_counties

  def primary_state
    sample_unit_states.try(:first).try(:state).try(:state_code)
  end

  def primary_county
    sample_unit_counties.try(:first).try(:county).try(:name)
  end
end
