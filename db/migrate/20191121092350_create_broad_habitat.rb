class CreateBroadHabitat < ActiveRecord::Migration[6.0]
  def change
    create_table :broad_habitats do |t|
      t.string :habitat_class
      t.string :habitat_form
    end
  end
end
