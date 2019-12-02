class CreateSampleUnit < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_units, id: false do |t|
      t.primary_key :sample_unit_id
      t.string :agency
      t.integer :grts
    end
  end
end
