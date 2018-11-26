class AddAssociationsToSampleDesigns < ActiveRecord::Migration[5.2]
  def change
    add_index :sample_designs, :sample_design_type_id
  end
end
