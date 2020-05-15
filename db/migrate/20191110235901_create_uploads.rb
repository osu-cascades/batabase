# frozen_string_literal: true

class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :filename
      t.text :data
      t.string :upload_type
    end
  end
end
