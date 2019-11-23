class CreateSoftware < ActiveRecord::Migration[6.0]
  def change
    create_table :softwares do |t|
      t.string :name
    end
  end
end
