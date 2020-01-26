# frozen_string_literal: true

class CreateLocalHabitat < ActiveRecord::Migration[6.0]
  def change
    create_table :local_habitats do |t|
      t.string :label
    end
  end
end
