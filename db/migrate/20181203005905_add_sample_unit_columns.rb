class AddSampleUnitColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :sample_units, :grts, :string
    add_reference :sample_units, :species_group, index: true
    add_reference :sample_units, :broad_habitat_form, index: true
  end
end
