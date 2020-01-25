# frozen_string_literal: true

class AddStateRefToSampleUnitState < ActiveRecord::Migration[6.0]
  def change
    add_reference :sample_unit_states, :state, null: false, foreign_key: true
  end
end
