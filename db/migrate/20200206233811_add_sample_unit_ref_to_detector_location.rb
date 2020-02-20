# frozen_string_literal: true

class AddSampleUnitRefToDetectorLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :detector_locations, :sample_unit, null: false, foreign_key: true
  end
end
