class SampleUnitCounty < ApplicationRecord
  validates :percentage, numericality: true

  belongs_to :sample_unit
  belongs_to :county

  # TODO: add methods for pulling data about county
end