class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :code
      t.string :common_name
      t.string :scientific_name
    end
  end
end
