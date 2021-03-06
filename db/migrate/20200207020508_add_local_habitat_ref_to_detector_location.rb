# frozen_string_literal: true

class AddLocalHabitatRefToDetectorLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :detector_locations, :local_habitat, null: false, foreign_key: true
  end
end
