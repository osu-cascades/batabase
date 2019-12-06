class SampleUnitCounty < ApplicationRecord
  validates :percentage, numericality: true

  belongs_to :sample_unit
  belongs_to :county

  def name
    county.name
  end

end