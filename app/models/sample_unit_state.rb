class SampleUnitState < ApplicationRecord
  validates :percentage, numericality: true

  belongs_to :sample_unit
  belongs_to :state

  # TODO: add methods for pulling data about state
end