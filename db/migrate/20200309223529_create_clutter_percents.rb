# frozen_string_literal: true

class CreateClutterPercents < ActiveRecord::Migration[6.0]
  def change
    create_table :clutter_percents do |t|
      t.string :label
    end
  end
end
