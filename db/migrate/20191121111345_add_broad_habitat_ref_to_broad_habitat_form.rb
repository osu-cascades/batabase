class AddBroadHabitatRefToBroadHabitatForm < ActiveRecord::Migration[6.0]
  def change
    add_reference :broad_habitat_forms, :broad_habitat, null: false, foreign_key: true
  end
end
