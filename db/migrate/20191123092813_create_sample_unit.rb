# frozen_string_literal: true

class CreateSampleUnit < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_units do |t|
      t.integer :code
      t.integer :grts
    end
  end
end
