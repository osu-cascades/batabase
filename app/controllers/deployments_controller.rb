# frozen_string_literal: true

class DeploymentsController < ApplicationController
  FIELDS = [
    [:detector_location, :location_identifier],
    [:detector_location, :land_ownership],
    :comments,
    :microphone_height_off_ground,
    :microphone_orientation,
    :sampling_frequency,
    :pre_trigger,
    :recording_length,
    :hp_filter,
    :auto_record,
    :trigger_sensitivity,
    :input_gain,
    :trigger_level,
    :interval,
    :gain,
    :sixteen_thousand_high_filter,
    :sample_rate,
    :min_duration,
    :max_duration,
    :min_trigger_frequency,
    :trigger_window,
    :max_length,
    :compression,
    :deployment_date,
    :recovery_date,
    :recording_start,
    :recording_stop
  ].freeze

  HEADERS = [
    'Location Identifier',
    'Agency',
    :comments,
    :microphone_height_off_ground,
    :microphone_orientation,
    :sampling_frequency,
    :pre_trigger,
    :recording_length,
    :hp_filter,
    :auto_record,
    :trigger_sensitivity,
    :input_gain,
    :trigger_level,
    :interval,
    :gain,
    :sixteen_thousand_high_filter,
    :sample_rate,
    :min_duration,
    :max_duration,
    :min_trigger_frequency,
    :trigger_window,
    :max_length,
    :compression,
    :deployment_date,
    :recovery_date,
    :recording_start,
    :recording_stop
  ].freeze

  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @fields = FIELDS
    @headers = HEADERS
    @helpers = helpers
    @search = ransack_params
    @deployments = ransack_result
  end

  def new
    @deployment = Deployment.new
    @model = @deployment
    @fields = fetch_form_fields
    @header_text = 'Create Deployment'
  end

  def create
    # TODO: permit these
    @deployment = Deployment.create(params[:deployment].to_unsafe_h)

    if @deployment.errors.any?
      redirect_to deployments_path, alert: @deployment.errors.messages
    else
      redirect_to deployments_path, notice: 'Deployment Successfully Added'
    end
  end

  def edit
    @deployment = Deployment.find(params[:id])
    @model = @deployment

    # TODO: make this less of a long boi
    @fields = fetch_form_fields(@deployment.clutter_percent_id, @deployment.clutter_type_id, @deployment.detector_id, @deployment.distance_range_id, @deployment.primary_contact_id, @deployment.recovery_contact_id)
    @header_text = 'Update Deployment'
  end

  def update
    # TODO: permit these
    update_success = Deployment.find(params[:id]).update(params[:deployment].to_unsafe_h)

    if !update_success
      redirect_to deployments_path, alert: 'Deployment Failed to Update'
    else
      redirect_to deployments_path, notice: 'Deployment Successfully Updated'
    end
  end

  def destroy
    # TODO: do something with result if result errors
    result = Deployment.destroy(params[:id])
    redirect_to deployments_path, notice: 'Deployment Successfully Deleted'
  end

  def export
    @deployments = Deployment.all
    respond_to do |format|
      format.xlsx do
        response.headers[
          'Content-Disposition'
        ] = 'attachment; filename=deployments.xlsx'
      end
      format.html { render :index }
    end
  end

  private

  def fetch_form_fields(clutter_percent = 1, clutter_type = 1, detector = 1, detector_location = 1, distance_range = 1, primary_contact = 1, recovery_contact = 1)
    [
      { type: :text_area, name: :comments, options: {} },
      { type: :text_field, name: :microphone_height_off_ground, options: {} },
      { type: :select, name: :microphone_orientation, options: { UNKNOWN: '', N: 'N', W: 'W', E: 'E', S: 'S', NW: 'NW', NE: 'NE', SW: 'SW', SE: 'SE', Vertical: 'Vertical' } },
      { type: :text_field, name: :sampling_frequency, options: {} },
      { type: :select, name: :pre_trigger, options: { OFF: 'OFF', ON: 'ON' } },
      { type: :text_field, name: :recording_length, options: {} },
      { type: :select, name: :hp_filter, options: { NO: 'NO', YES: 'YES' } },
      { type: :select, name: :auto_record, options: { YES: 'YES', NO: 'NO' } },
      { type: :select, name: :trigger_sensitivity, options: { LOW: 'LOW', MED: 'MED', HIGH: 'HIGH' } },
      { type: :text_field, name: :input_gain, options: {} },
      { type: :text_field, name: :trigger_level, options: {} },
      { type: :text_field, name: :interval, options: {} },
      { type: :text_field, name: :gain, options: {} },
      { type: :select, name: :sixteen_thousand_high_filter, options: { OFF: 'OFF', ON: 'ON' } },
      { type: :text_field, name: :sample_rate, options: {} },
      { type: :text_field, name: :min_duration, options: {} },
      { type: :text_field, name: :max_duration, options: {} },
      { type: :text_field, name: :min_trigger_frequency, options: {} },
      { type: :text_field, name: :trigger_window, options: {} },
      { type: :text_field, name: :max_length, options: {} },
      { type: :text_field, name: :compression, options: {} },
      { type: :datetime_field, name: :deployment_date, options: {} },
      { type: :datetime_field, name: :recovery_date, options: {} },
      { type: :datetime_field, name: :recording_start, options: {} },
      { type: :datetime_field, name: :recording_stop, options: {} },
      { type: :select, name: :primary_contact_id, options: helpers.options_from_collection_for_select(Contact.all, 'id', 'formal_full_name', primary_contact) },
      { type: :select, name: :recovery_contact_id, options: helpers.options_from_collection_for_select(Contact.all, 'id', 'formal_full_name', recovery_contact) },
      { type: :select, name: :detector_id, options: helpers.options_from_collection_for_select(Detector.all, 'id', 'serial_number', detector) },
      { type: :select, name: :distance_range_id, options: helpers.options_from_collection_for_select(DistanceRange.all, 'id', 'label', distance_range) },
      { type: :select, name: :clutter_percent_id, options: helpers.options_from_collection_for_select(ClutterPercent.all, 'id', 'label', clutter_percent) },
      { type: :select, name: :clutter_type_id, options: helpers.options_from_collection_for_select(ClutterType.all, 'id', 'name', clutter_type) },
      { type: :select, name: :detector_location_id, options: helpers.options_from_collection_for_select(DetectorLocation.all, 'id', 'location_identifier', detector_location) }
    ]
  end

  def invalid_foreign_key(exception)
    redirect_to deployments_path, alert: "DELETE CANCELED:  #{exception}"
  end

  def ransack_params
    Deployment.includes(:detector_location).ransack(params[:q])
  end

  def ransack_result
    @search.result.page(params[:page])
  end
end
