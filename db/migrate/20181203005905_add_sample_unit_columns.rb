class AddSampleUnitColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :sample_units, :grts, :string
    add_reference :sample_units, :species_group, index: true
  end
end
