# frozen_string_literal: true

class DetectorsController < ApplicationController
  FIELDS = [:firmware, :manufacturer, :model, :serial_number, [:organization, :name]].freeze
  HEADERS = [:firmware, :manufacturer, :model, :serial_number, 'Organization'].freeze

  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @fields = FIELDS
    @headers = HEADERS
    @helpers = helpers
    @search = ransack_params
    @detectors = ransack_result
  end

  def new
    @detector = Detector.new
    @model = @detector
    @fields = fetch_form_fields
    @header_text = 'Create Detector'
  end

  def create
    # TODO: permit these
    @detector = Detector.create(params[:detector].to_unsafe_h)

    if @detector.errors.any?
      redirect_to detectors_path, alert: @detector.errors.messages
    else
      redirect_to detectors_path, notice: 'Detector Successfully Added'
    end
  end

  def edit
    @detector = Detector.find(params[:id])
    @model = @detector
    @fields = fetch_form_fields(@detector.organization_id)
    @header_text = 'Update Detector'
  end

  def update
    # TODO: permit these
    update_success = Detector.find(params[:id]).update(params[:detector].to_unsafe_h)

    if !update_success
      redirect_to detectors_path, alert: 'Detector Failed to Update'
    else
      redirect_to detectors_path, notice: 'Detector Successfully Updated'
    end
  end

  def destroy
    @detector = Detector.destroy(params[:id])
    redirect_to detectors_path, notice: 'Detector Successfully Deleted'
  end

  def export
    @detectors = Detector.all
    respond_to do |format|
      format.xlsx do
        response.headers[
          'Content-Disposition'
        ] = 'attachment; filename=detectors.xlsx'
      end
      format.html { render :index }
    end
  end

  private

  def fetch_form_fields(organization = 1)
    [
      { type: :text_field, name: :firmware, options: {} },
      { type: :text_field, name: :manufacturer, options: {} },
      { type: :text_field, name: :model, options: {} },
      { type: :text_field, name: :serial_number, options: {} },
      { type: :select, name: :organization_id, options: helpers.options_from_collection_for_select(Organization.all, 'id', 'name', organization) }
    ]
  end

  def invalid_foreign_key(exception)
    redirect_to detectors_path, alert: "DELETE CANCELED:  #{exception}"
  end

  def ransack_params
    Detector.includes(:organization).ransack(params[:q])
  end

  def ransack_result
    @search.result.page(params[:page])
  end
end
