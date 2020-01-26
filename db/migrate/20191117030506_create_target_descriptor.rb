# frozen_string_literal: true

class CreateTargetDescriptor < ActiveRecord::Migration[6.0]
  def change
    create_table :target_descriptors do |t|
      t.string :label
    end
  end
end
