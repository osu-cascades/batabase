# frozen_string_literal: true

class AddSampleUnitRefToSampleUnitState < ActiveRecord::Migration[6.0]
  def change
    add_reference :sample_unit_states, :sample_unit, null: false, foreign_key: true
  end
end
