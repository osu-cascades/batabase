class CreateSpeciesGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :species_groups do |t|
      t.string :label
      t.string :summary
    end
  end
end
