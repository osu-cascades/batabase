# frozen_string_literal: true
require 'csv'

class ContactsController < ApplicationController
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @contacts_grid = ContactsGrid.new(params[:contacts_grid])
  end

  def new
    @contact = Contact.new
    @model = @contact

    organization_names = Organization.all.map{ |org| [org.name, org.name] }.to_h
    states = CSV.read(Rails.root.join('db/seed_data/states.csv')).to_h
    
    @fields = [
      { type: :text_field, name: :first_name, options: {} },
      { type: :text_field, name: :last_name, options: {} },
      { type: :text_area, name: :notes, options: {} },
      { type: :select, name: :state, options: states },
      { type: :select, name: :organization, options: organization_names }
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

  def edit
    @contact = Contact.find(params[:id])
    @model = @contact

    states = CSV.read(Rails.root.join('db/seed_data/states.csv')).to_h
    organization_names = Organization.all.map{ |org| [org.name, org.name] }.to_h

    selected_state = { "#{@contact.state.name}": "#{@contact.state.abbreviation}" }
    selected_organization = { "#{@contact.organization.name}": "#{@contact.organization.name}" }

    @fields = [
      { type: :text_field, name: :first_name, options: {} },
      { type: :text_field, name: :last_name, options: {} },
      { type: :text_area, name: :notes, options: {} },
      { type: :select, name: :state, options: selected_state.merge(states) },
      { type: :select, name: :employer, options: selected_organization.merge(organization_names) }
    ]

    @header_text = "Update Contact"
  end

  def update
    first_name = params[:contact][:first_name]
    last_name = params[:contact][:last_name]
    notes = params[:contact][:notes]
    state_abbreviation = params[:contact][:state]
    organization_name = params[:contact][:employer]

    contact_to_update = Contact.find(params[:id])

    state = State.find_by(abbreviation: state_abbreviation)
    organization = Organization.find_by(name: organization_name)

    contact_to_update.update(
      first_name: first_name,
      last_name: last_name,
      notes: notes,
      state_id: state.id,
      organization_id: organization.id
    )

    if contact_to_update.errors.any?
      redirect_to contacts_path, alert: contact_to_update.errors.messages
      return
    end

    redirect_to contacts_path, notice: 'Contact Successfully Updated'
    return
  end

  def destroy
    @contact = Contact.destroy(params[:id])
    redirect_to contacts_path, notice: 'Contact Successfully Deleted'
    return
  end

  private

  def invalid_foreign_key(exception)
    redirect_to contacts_path, alert: "DELETE CANCELED: #{exception}"
    return
  end
end
