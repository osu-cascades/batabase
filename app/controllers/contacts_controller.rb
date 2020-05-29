# frozen_string_literal: true

require 'csv'

class ContactsController < ApplicationController
  FIELDS = [:first_name, :last_name, :notes, [:organization, :name]].freeze
  HEADERS = [:first_name, :last_name, :notes, 'Organization'].freeze

  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @fields = FIELDS
    @headers = HEADERS
    @helpers = helpers
    @search = ransack_params
    @contacts = ransack_result
  end

  def new
    @contact = Contact.new
    @model = @contact
    @fields = fetch_form_fields
    @header_text = 'Create Contact'
  end

  def create
    # TODO: permit these
    @contact = Contact.create(params[:contact].to_unsafe_h)

    if @contact.errors.any?
      redirect_to contacts_path, alert: @contact.errors.messages
    else
      redirect_to contacts_path, notice: 'Contact Successfully Added'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    @model = @contact
    @fields = fetch_form_fields(@contact.organization_id, @contact.state_id)
    @header_text = 'Update Contact'
  end

  def update
    # TODO: permit these
    update_success = Contact.find(params[:id]).update(params[:contact].to_unsafe_h)

    if !update_success
      redirect_to contacts_path, alert: 'Contact Failed to Update'
    else
      redirect_to contacts_path, notice: 'Contact Successfully Updated'
    end
  end

  def destroy
    @contact = Contact.destroy(params[:id])
    redirect_to contacts_path, notice: 'Contact Successfully Deleted'
  end

  def export
    @contacts = Contact.all
    respond_to do |format|
      format.xlsx do
        response.headers[
          'Content-Disposition'
        ] = 'attachment; filename=contacts.xlsx'
      end
      format.html { render :index }
    end
  end

  private

  def fetch_form_fields(organization = 1, state = 1)
    [
      { type: :text_field, name: :first_name, options: {} },
      { type: :text_field, name: :last_name, options: {} },
      { type: :text_area, name: :notes, options: {} },
      { type: :select, name: :state_id, options: helpers.options_from_collection_for_select(State.all, 'id', 'name', state) },
      { type: :select, name: :organization_id, options: helpers.options_from_collection_for_select(Organization.all, 'id', 'name', organization) }
    ]
  end

  def invalid_foreign_key(exception)
    redirect_to contacts_path, alert: "DELETE CANCELED: #{exception}"
  end

  def ransack_params
    Contact.includes(:organization).ransack(params[:q])
  end

  def ransack_result
    @search.result.page(params[:page])
  end
end
