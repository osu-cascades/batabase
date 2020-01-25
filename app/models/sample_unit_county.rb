# frozen_string_literal: true

class SampleUnitCounty < ApplicationRecord
  validates :percentage, numericality: { greater_than: 0.0 }

  belongs_to :sample_unit
  belongs_to :county

  def name
    county.name
  end
end
