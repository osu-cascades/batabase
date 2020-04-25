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
    first_name = params[:contact][:first_name]
    last_name = params[:contact][:last_name]
    notes = params[:contact][:notes]
    state_abbreviation = params[:contact][:state]
    organization_name = params[:contact][:organization]

    state = State.find_by(abbreviation: state_abbreviation)
    organization = Organization.find_by(name: organization_name)

    if organization.nil?
      organization = Organization.find_by(name: 'Other')
    end

    @contact = Contact.create(
      first_name: first_name,
      last_name: last_name,
      notes: notes,
      state_id: state.id,
      organization_id: organization.id
    )

    if @contact.errors.any?
      redirect_to contacts_path, alert: @contact.errors.messages
      return
    end

    redirect_to contacts_path, notice: 'Contact Successfully Added'
    return
  end

end
