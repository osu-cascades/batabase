class CreateBroadHabitatForms < ActiveRecord::Migration[5.2]
  def change
    create_table :broad_habitat_forms do |t|
      t.string :label
      t.belongs_to :broad_habitat, index: true
      t.timestamps
    end
  end
end
