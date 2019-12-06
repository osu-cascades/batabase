class AddOrganizationToContacts < ActiveRecord::Migration[6.0]
  def change
    add_reference :contacts, :organization, null: false, foreign_key: true
  end
end
