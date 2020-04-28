# frozen_string_literal: true

class DeploymentsController < ApplicationController
  def index
    @deployments_grid = DeploymentsGrid.new(params[:deployments_grid])
  end

  def new
    @deployment = Deployment.new

    @model = @deployment

    contact_names = Contact.all.map { |c| ["#{c.last_name}, #{c.first_name}", c.id ] }.to_h
    organization_names = Organization.all.map{ |org| [org.name, org.id] }.to_h
    detector_serial_numbers = Detector.all.map{ |d| [d.serial_number, d.id] }.to_h
    distance_ranges = DistanceRange.all.map{ |dr| [dr.label, dr.id ] }.to_h
    clutter_percents = ClutterPercent.all.map{ |cp| [cp.label, cp.id] }.to_h
    clutter_types = ClutterType.all.map{ |c| [c.name, c.id] }.to_h
    habitats = LocalHabitat.all.map{ |lh| [lh.label, lh.id] }.to_h
    detection_targets = DetectionTarget.all.map{ |d| [d.label, d.id ] }.to_h
    target_descriptors = TargetDescriptor.all.map{ |t| [t.label, t.id] }.to_h


    @fields = [
      { type: :text_area, name: :notes, options: {} },
      { type: :text_field, name: :microphone_height_off_ground, options: {} },
      { type: :text_field, name: :microphone_orientation, options: {} },
      { type: :text_field, name: :sampling_frequency, options: {} },
      { type: :select, name: :pre_trigger, options: { OFF: "OFF", ON: "ON" } },
      { type: :text_field, name: :recording_length, options: {} },
      { type: :select, name: :hp_filter, options: { NO: "NO", YES: "YES" } },
      { type: :select, name: :auto_record, options: { YES: "YES", NO: "NO",  } },
      { type: :select, name: :trigger_sensitivity, options: {  LOW: "LOW", MED: "MED", HIGH: "HIGH" } },
      { type: :text_field, name: :input_gain, options: {} },
      { type: :text_field, name: :trigger_level, options: {} },
      { type: :text_field, name: :interval, options: {} },
      { type: :text_field, name: :gain, options: {} },
      { type: :select, name: :sixteen_thousand_high_filter, options: { OFF: "OFF", ON: "ON" } },
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
      { type: :datetime_field, name: :recording_start, options: {} },
      { type: :select, name: :primary_contact, options: contact_names },
      { type: :select, name: :recovery_contact, options: contact_names },
      { type: :text_field, name: "Location ID", options: {} },
      { type: :text_field, name: "Latitude", options: {} },
      { type: :text_field, name: "Longitude", options: {} },
      { type: :text_field, name: "Site Name", options: {} },
      { type: :text_area, name: "Directions to Site", options: {} },
      { type: :text_field, name: "Site Name", options: {} },
      { type: :select, name: "Land Ownership", options: organization_names },
      { type: :select, name: "Detector Serial Number", options: detector_serial_numbers },
      { type: :select, name: "Distance to Clutter", options: distance_ranges },
      { type: :select, name: "Clutter Category", options: clutter_percents },
      { type: :select, name: "Clutter Type", options: clutter_types },
      { type: :select, name: "Habitat", options: habitats },
      { type: :select, name: "Target", options: detection_targets },
      { type: :select, name: "Descriptor", options: target_descriptors },
      { type: :text_area, name: :comments, options: {} }
    ] 

    @header_text = "Create Deployment"
  end
end
