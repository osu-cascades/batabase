class CreateRansackQuery < ActiveRecord::Migration[6.0]
  def change
    create_table :ransack_queries do |t|
      t.string :name
      t.string :query_string
    end
  end
end
