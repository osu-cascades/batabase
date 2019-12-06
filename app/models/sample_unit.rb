class SampleUnit < ApplicationRecord
  validates :agency, length: { maximum: 50 }
  validates :grts, numericality: { only_integer: true }

  # TODO: Create Detector locations table and it's associations
  # has_many :detector_locations, dependent: :destroy
  # accepts_nested_attributes_for :detector_locations, allow_destroy: true

  belongs_to :broad_habitat, optional: true
  belongs_to :broad_habitat_form, optional: true

  has_many :sample_unit_states
  has_many :sample_unit_counties

  has_many :states, through: :sample_unit_states
  has_many :counties, through: :sample_unit_counties

  def broad_habitat_name
    broad_habitat.name
  end

  def broad_habitat_form_name
    broad_habitat_form.name
  end

  def primary_state
    sample_unit_states.max_by(&:percentage)
  end

  def primary_state_name
    sample_unit_states.max_by(&:percentage).name
  end

  def primary_state_abbreviation
    sample_unit_states.max_by(&:percentage).abbreviation
  end

  def primary_state_percentage
    sample_unit_states.max_by(&:percentage).percentage
  end

  def primary_county
    sample_unit_counties.max_by(&:percentage)
  end

  def primary_county_name
    sample_unit_counties.max_by(&:percentage).name
  end

  def primary_county_percentage
    sample_unit_counties.max_by(&:percentage).percentage
  end

end