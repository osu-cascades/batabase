# frozen_string_literal: true

class AddBroadHabitatFormRefToSampleUnit < ActiveRecord::Migration[6.0]
  def change
    add_reference :sample_units, :broad_habitat_form, null: true, foreign_key: true
  end
end
