# frozen_string_literal: true

class ContactsController < ApplicationController
  def index
    @contacts_grid = ContactsGrid.new(params[:contacts_grid])
  end

  def new
    @contact = Contact.new
    @model = @contact
    @fields = [
      :first_name,
      :last_name,
      :state,
      :organization
    ]

    @header_text = "Create Contact"
  end
end
