class CreateLocationMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :location_mappings do |t|
      t.string :name

      t.timestamps
    end
  end
end
