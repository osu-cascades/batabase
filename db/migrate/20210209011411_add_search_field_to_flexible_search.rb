class AddSearchFieldToFlexibleSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :flexible_searches, :search_field, :string, default: ""
  end
end
