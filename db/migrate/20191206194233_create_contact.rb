class CreateContact < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :notes
    end
  end
end
