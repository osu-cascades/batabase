class AddTableToSearchField < ActiveRecord::Migration[6.0]
  def change
    add_column :search_fields, :table, :string
  end
end
