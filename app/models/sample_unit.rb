class SampleUnit < ApplicationRecord
  validate :agency
  validates :grts, numericality: { only_integer: true }

  # TODO: Detector locations
  # has_many :detector_locations, dependent: :destroy
  # accepts_nested_attributes_for :detector_locations, allow_destroy: true

  belongs_to :broad_habitat, optional: true
  belongs_to :broad_habitat_form, optional: true

  has_many :sample_unit_states
  has_many :sample_unit_counties

  has_many :states, through: :sample_unit_states
  has_many :counties, through: :sample_unit_counties

  def primary_state
    # TODO: this
  end

  def primary_county
    # TODO: this
  end

  # TODO: add methods for pulling data about states and counties and their percents
end