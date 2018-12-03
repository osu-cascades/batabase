class AddSampleUnitColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :sample_units, :grts, :string
    add_column :sample_units, :state_1_id, :integer, index: true
    add_column :sample_units, :state_2_id, :integer, index: true
    add_column :sample_units, :county_1, :string, index: true
    add_column :sample_units, :county_2, :string, index: true
    add_reference :sample_units, :species_group, index: true
  end
end
