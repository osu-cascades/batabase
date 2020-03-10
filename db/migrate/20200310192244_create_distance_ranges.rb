# frozen_string_literal: true

class CreateDistanceRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :distance_ranges do |t|
      t.string :label
    end
  end
end
