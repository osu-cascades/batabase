class ContactAssociations < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :state, index: true
    add_reference :contacts, :organization, index: true
  end
end
