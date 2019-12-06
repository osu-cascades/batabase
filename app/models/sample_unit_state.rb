class SampleUnitState < ApplicationRecord
  validates :percentage, numericality: true

  belongs_to :sample_unit
  belongs_to :state

  def name
    state.name
  end

  def abbreviation
    state.abbreviation
  end
end