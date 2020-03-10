# frozen_string_literal: true

class AddBroadHabitatRefToSampleUnit < ActiveRecord::Migration[6.0]
  def change
    add_reference :sample_units, :broad_habitat, null: true, foreign_key: true
  end
end
