# frozen_string_literal: true

class AddStateRefToContacts < ActiveRecord::Migration[6.0]
  def change
    add_reference :contacts, :state, null: false, foreign_key: true
  end
end
