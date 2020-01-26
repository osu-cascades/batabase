# frozen_string_literal: true

class SampleUnitState < ApplicationRecord
  validates :percentage, numericality: { greater_than: 0.0 }

  belongs_to :sample_unit
  belongs_to :state

  def name
    state.name
  end

  def abbreviation
    state.abbreviation
  end
end
