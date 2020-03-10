# frozen_string_literal: true

class CreateClutterTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :clutter_types do |t|
      t.string :name
    end
  end
end
