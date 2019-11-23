class CreateSampleUnit < ActiveRecord::Migration[6.0]
  def change
    # TODO: figure out how to force custom IDs here and while building from seed data
    create_table :sample_units, id: false do |t|
      t.string :agency
      t.integer :grts
    end
  end
end
