class CreateBroadHabitat < ActiveRecord::Migration[6.0]
  def change
    create_table :broad_habitats do |t|
      t.string :label
    end
  end
end
