class AddSearchablesToFlexibleSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :flexible_searches, :searchables, :text, array: true, default: []
  end
end
