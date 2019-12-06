class CreateBroadHabitatForm < ActiveRecord::Migration[6.0]
  def change
    create_table :broad_habitat_forms do |t|
      t.string :name
    end
  end
end
