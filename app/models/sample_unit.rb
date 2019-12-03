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

  def broad_habitat_label
    broad_habitat.label
  end


  def broad_habitat_form_label
    broad_habitat_form.label
  end

  def primary_state
    # TODO: this
  end

  def primary_county
    # TODO: this
  end

  # TODO: add methods for pulling data about states and counties and their percents
end