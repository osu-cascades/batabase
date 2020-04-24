# frozen_string_literal: true
require 'csv'

class ContactsController < ApplicationController
  def index
    @contacts_grid = ContactsGrid.new(params[:contacts_grid])
  end

  def new
    @contact = Contact.new
    @model = @contact
    states = CSV.read(Rails.root.join('db/seed_data/states.csv')).to_h
    @fields = [
      { type: :text_field, name: :first_name, options: {} },
      { type: :text_field, name: :last_name, options: {} },
      { type: :text_area, name: :notes, options: {} },
      { type: :select, name: :state, options: states },
      { type: :text_field, name: :organization, options: {} }
    ]

    @header_text = "Create Contact"
  end

  def create
    byebug
  end

end
