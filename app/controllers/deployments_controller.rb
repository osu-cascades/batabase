# frozen_string_literal: true

class DeploymentsController < ApplicationController
  def index
    @deployments_grid = DeploymentsGrid.new(params[:deployments_grid])
  end

  def new
    @deployment = Deployment.new

    @model = @deployment

    contact_names = Contact.all.map { |c| ["#{c.last_name}, #{c.first_name}", c.id ] }.to_h
    organization_names = Organization.all.map{ |org| [org.name, org.name] }.to_h
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
      { type: :select, name: :microphone_orientation, options: { UNKNOWN: '', N: 'N', W: 'W', E: 'E', S: 'S', NW: 'NW', NE: 'NE', SW: 'SW', SE: 'SE', Vertical: 'Vertical' } },
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
      { type: :datetime_field, name: :recording_stop, options: {} },
      { type: :select, name: :primary_contact, options: contact_names },
      { type: :select, name: :recovery_contact, options: contact_names },
      { type: :text_field, name: "Location ID", options: {} },
      { type: :text_field, name: "Latitude", options: {} },
      { type: :text_field, name: "Longitude", options: {} },
      { type: :text_field, name: "Site Name", options: {} },
      { type: :text_area, name: "Directions to Site", options: {} },
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

  def create
    notes = params[:deployment][:notes]
    microphone_height_off_ground = params[:deployment][:microphone_height_off_ground]
    microphone_orientation = params[:deployment][:microphone_orientation]
    sampling_frequency = params[:deployment][:sampling_frequency]
    pre_trigger = params[:deployment][:pre_trigger]
    recording_length = params[:deployment][:recording_length]
    hp_filter = params[:deployment][:hp_filter]
    auto_record = params[:deployment][:auto_record]
    trigger_sensitivity = params[:deployment][:trigger_sensitivity]
    input_gain = params[:deployment][:input_gain]
    trigger_level = params[:deployment][:trigger_level]
    interval = params[:deployment][:interval]
    gain = params[:deployment][:gain]
    sixteen_thousand_high_filter = params[:deployment][:sixteen_thousand_high_filter]
    sample_rate = params[:deployment][:sample_rate]
    min_duration = params[:deployment][:min_duration]
    max_duration = params[:deployment][:max_duration]
    min_trigger_frequency = params[:deployment][:min_trigger_frequency]
    trigger_window = params[:deployment][:min_trigger_frequency]
    max_length = params[:deployment][:max_length]
    compression = params[:deployment][:compression]
    deployment_date_string = params[:deployment][:deployment_date]
    recovery_date_string = params[:deployment][:recovery_date]
    recording_start_string = params[:deployment][:recording_start]
    recording_stop_string = params[:deployment][:recording_stop]
    primary_contact_id = params[:deployment][:primary_contact]
    recovery_contact_id = params[:deployment][:recovery_contact]
    location_identifier = params[:deployment]["Location ID"]
    latitude = params[:deployment]["Latitude"]
    longitude = params[:deployment]["Longitude"]
    site_name = params[:deployment]["Site Name"]
    directions_to_site = params[:deployment]["Directions to Site"]
    land_ownership = params[:deployment]["Land Ownership"]
    detector_id = params[:deployment]["Detector Serial Number"]
    distance_range_id = params[:deployment]["Distance to Clutter"]
    clutter_percent_id = params[:deployment]["Clutter Category"]
    clutter_type_id = params[:deployment]["Clutter Type"]
    local_habitat_id = params[:deployment]["Habitat"]
    detection_target_id = params[:deployment]["Target"]
    target_descriptor_id = params[:deployment]["Descriptor"]
    comments = params[:deployment][:comments]

    detector_location = DetectorLocation.find_by(location_identifier: location_identifier)

    if detector_location.nil?
      sample_unit_code = location_identifier.split('_')

      sample_unit = SampleUnit.find_by(code: sample_unit_code[0])

      quad_number = location_identifier.split('').pop
      quad_id = location_identifier[-3, 2].upcase

      detector_location = DetectorLocation.create(
        quad_id: quad_id,
        quad_no: quad_number,
        location_name: site_name,
        latitude: latitude,
        longitude: longitude,
        driving_directions: directions_to_site,
        land_ownership: land_ownership,
        sample_unit_id: sample_unit.id,
        local_habitat_id: local_habitat_id,
        detection_target_id: detection_target_id,
        target_descriptor_id: target_descriptor_id
      )

      if detector_location.errors.any?
        redirect_to deployments_path, alert: detector_location.errors.messages
        return
      end
    end

    result = Deployment.create!(
      detector_location_id: detector_location.id,
      clutter_type_id: clutter_type_id,
      clutter_percent_id: clutter_percent_id,
      distance_range_id: distance_range_id,
      detector_id: detector_id,
      deployment_date: deployment_date_string,
      recovery_date: recovery_date_string,
      primary_contact_id: primary_contact_id,
      recovery_contact_id: recovery_contact_id,
      microphone_height_off_ground: microphone_height_off_ground,
      microphone_orientation: microphone_orientation,
      sampling_frequency: sampling_frequency,
      pre_trigger: pre_trigger,
      recording_length: recording_length,
      hp_filter: hp_filter,
      auto_record: auto_record,
      trigger_sensitivity: trigger_sensitivity,
      input_gain: input_gain,
      trigger_level: trigger_level,
      interval: interval,

      gain: gain,
      sixteen_thousand_high_filter: sixteen_thousand_high_filter,
      sample_rate: sample_rate,
      min_duration: min_duration,
      max_duration: max_duration,
      min_trigger_frequency: min_trigger_frequency,
      trigger_window: trigger_window,
      max_length: max_length,
      compression: compression,
      recording_start: recording_start_string,
      recording_stop: recording_stop_string,
      comments: comments
    )

    if result.errors.any?
      redirect_to deployments_path, alert: result.errors.messages
    end


    redirect_to deployments_path, notice: 'Deployment Successfully Added'
    return
  end

  def edit
    deployment = Deployment.find(params[:id])
    @model = deployment

    @fields = contact_names = Contact.all.map { |c| ["#{c.last_name}, #{c.first_name}", c.id ] }.to_h
    organization_names = Organization.all.map{ |org| [org.name, org.name] }.to_h
    detector_serial_numbers = Detector.all.map{ |d| [d.serial_number, d.id] }.to_h
    distance_ranges = DistanceRange.all.map{ |dr| [dr.label, dr.id ] }.to_h
    clutter_percents = ClutterPercent.all.map{ |cp| [cp.label, cp.id] }.to_h
    clutter_types = ClutterType.all.map{ |c| [c.name, c.id] }.to_h
    habitats = LocalHabitat.all.map{ |lh| [lh.label, lh.id] }.to_h
    detection_targets = DetectionTarget.all.map{ |d| [d.label, d.id ] }.to_h
    target_descriptors = TargetDescriptor.all.map{ |t| [t.label, t.id] }.to_h

    selected_primary_contact = { "#{deployment.primary_contact.last_name}, #{deployment.primary_contact.first_name}": deployment.primary_contact.id }
    selected_recovery_contact = { "#{deployment.recovery_contact.last_name}, #{deployment.recovery_contact.first_name}": deployment.primary_contact.id }
    location_identifier = deployment.detector_location.location_identifier
    latitude = deployment.detector_location.latitude
    longitude = deployment.detector_location.longitude
    location_name = deployment.detector_location.location_name
    driving_directions = deployment.detector_location.driving_directions
    selected_land_ownership = { "#{deployment.detector_location.land_ownership}": "#{deployment.detector_location.land_ownership}" }
    selected_serial_number = { "#{deployment.detector.serial_number}": deployment.detector.id }
    selected_distance_range = { "#{deployment.distance_range.label}": deployment.distance_range.id }
    selected_clutter_percent = { "#{deployment.clutter_percent.label}": deployment.clutter_percent.id }
    selected_clutter_type = { "#{deployment.clutter_type.name}": deployment.clutter_type.id }
    selected_local_habitat = { "#{deployment.detector_location.local_habitat.label}": deployment.detector_location.local_habitat.id }
    selected_detection_target = { "#{deployment.detector_location.detection_target.label}": deployment.detector_location.detection_target.id }
    selected_target_descriptor = { "#{deployment.detector_location.target_descriptor.label}": deployment.detector_location.target_descriptor.id }

    @fields = [
      { type: :text_area, name: :notes, options: {} },
      { type: :text_field, name: :microphone_height_off_ground, options: {} },
      { type: :select, name: :microphone_orientation, options: { UNKNOWN: '', N: 'N', W: 'W', E: 'E', S: 'S', NW: 'NW', NE: 'NE', SW: 'SW', SE: 'SE', Vertical: 'Vertical' } },
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
      { type: :datetime_field, name: :recording_stop, options: {} },
      { type: :select, name: :primary_contact, options: selected_primary_contact.merge(contact_names) },
      { type: :select, name: :recovery_contact, options: selected_recovery_contact.merge(contact_names) },
      { type: :text_field, name: "Location ID", options: { value: location_identifier } },
      { type: :text_field, name: "Latitude", options: { value: latitude } },
      { type: :text_field, name: "Longitude", options: { value: longitude } },
      { type: :text_field, name: "Site Name", options: { value: location_name } },
      { type: :text_area, name: "Directions to Site", options: { value: driving_directions } },
      { type: :select, name: "Land Ownership", options: selected_land_ownership.merge(organization_names) },
      { type: :select, name: "Detector Serial Number", options: selected_serial_number.merge(detector_serial_numbers) },
      { type: :select, name: "Distance to Clutter", options: selected_distance_range.merge(distance_ranges) },
      { type: :select, name: "Clutter Category", options: selected_clutter_percent.merge(clutter_percents) },
      { type: :select, name: "Clutter Type", options: selected_clutter_type.merge(clutter_types) },
      { type: :select, name: "Habitat", options: selected_local_habitat.merge(habitats) },
      { type: :select, name: "Target", options: selected_detection_target.merge(detection_targets) },
      { type: :select, name: "Descriptor", options: selected_target_descriptor.merge(target_descriptors) },
      { type: :text_area, name: :comments, options: {} }
    ]
    
    @header_text = 'Update Deployment'
  end

  def update
    notes = params[:deployment][:notes]
    microphone_height_off_ground = params[:deployment][:microphone_height_off_ground]
    microphone_orientation = params[:deployment][:microphone_orientation]
    sampling_frequency = params[:deployment][:sampling_frequency]
    pre_trigger = params[:deployment][:pre_trigger]
    recording_length = params[:deployment][:recording_length]
    hp_filter = params[:deployment][:hp_filter]
    auto_record = params[:deployment][:auto_record]
    trigger_sensitivity = params[:deployment][:trigger_sensitivity]
    input_gain = params[:deployment][:input_gain]
    trigger_level = params[:deployment][:trigger_level]
    interval = params[:deployment][:interval]
    gain = params[:deployment][:gain]
    sixteen_thousand_high_filter = params[:deployment][:sixteen_thousand_high_filter]
    sample_rate = params[:deployment][:sample_rate]
    min_duration = params[:deployment][:min_duration]
    max_duration = params[:deployment][:max_duration]
    min_trigger_frequency = params[:deployment][:min_trigger_frequency]
    trigger_window = params[:deployment][:min_trigger_frequency]
    max_length = params[:deployment][:max_length]
    compression = params[:deployment][:compression]
    deployment_date_string = params[:deployment][:deployment_date]
    recovery_date_string = params[:deployment][:recovery_date]
    recording_start_string = params[:deployment][:recording_start]
    recording_stop_string = params[:deployment][:recording_stop]
    primary_contact_id = params[:deployment][:primary_contact]
    recovery_contact_id = params[:deployment][:recovery_contact]
    location_identifier = params[:deployment]["Location ID"]
    latitude = params[:deployment]["Latitude"]
    longitude = params[:deployment]["Longitude"]
    site_name = params[:deployment]["Site Name"]
    directions_to_site = params[:deployment]["Directions to Site"]
    land_ownership = params[:deployment]["Land Ownership"]
    detector_id = params[:deployment]["Detector Serial Number"]
    distance_range_id = params[:deployment]["Distance to Clutter"]
    clutter_percent_id = params[:deployment]["Clutter Category"]
    clutter_type_id = params[:deployment]["Clutter Type"]
    local_habitat_id = params[:deployment]["Habitat"]
    detection_target_id = params[:deployment]["Target"]
    target_descriptor_id = params[:deployment]["Descriptor"]
    comments = params[:deployment][:comments]

    deployment_to_update = Deployment.find(params[:id])

    detector_location = DetectorLocation.find_by(location_identifier: location_identifier)
    
    if detector_location.nil?
      sample_unit_code = location_identifier.split('_')

      sample_unit = SampleUnit.find_by(code: sample_unit_code[0])

      quad_number = location_identifier.split('').pop
      quad_id = location_identifier[-3, 2].upcase

      detector_location = DetectorLocation.create(
        quad_id: quad_id,
        quad_no: quad_number,
        location_name: site_name,
        latitude: latitude,
        longitude: longitude,
        driving_directions: directions_to_site,
        land_ownership: land_ownership,
        sample_unit_id: sample_unit.id,
        local_habitat_id: local_habitat_id,
        detection_target_id: detection_target_id,
        target_descriptor_id: target_descriptor_id
      )

      if detector_location.errors.any?
        redirect_to deployments_path, alert: detector_location.errors.messages
        return
      end
    else
      sample_unit_code = location_identifier.split('_')

      sample_unit = SampleUnit.find_by(code: sample_unit_code[0])

      quad_number = location_identifier.split('').pop
      quad_id = location_identifier[-3, 2].upcase

      detector_location.update(
        quad_id: quad_id,
        quad_no: quad_number,
        location_name: site_name,
        latitude: latitude,
        longitude: longitude,
        driving_directions: directions_to_site,
        land_ownership: land_ownership,
        sample_unit_id: sample_unit.id,
        local_habitat_id: local_habitat_id,
        detection_target_id: detection_target_id,
        target_descriptor_id: target_descriptor_id
      )
    end

    deployment_to_update.update(
      detector_location_id: detector_location.id,
      clutter_type_id: clutter_type_id,
      clutter_percent_id: clutter_percent_id,
      distance_range_id: distance_range_id,
      detector_id: detector_id,
      deployment_date: deployment_date_string,
      recovery_date: recovery_date_string,
      primary_contact_id: primary_contact_id,
      recovery_contact_id: recovery_contact_id,
      microphone_height_off_ground: microphone_height_off_ground,
      microphone_orientation: microphone_orientation,
      sampling_frequency: sampling_frequency,
      pre_trigger: pre_trigger,
      recording_length: recording_length,
      hp_filter: hp_filter,
      auto_record: auto_record,
      trigger_sensitivity: trigger_sensitivity,
      input_gain: input_gain,
      trigger_level: trigger_level,
      interval: interval,

      gain: gain,
      sixteen_thousand_high_filter: sixteen_thousand_high_filter,
      sample_rate: sample_rate,
      min_duration: min_duration,
      max_duration: max_duration,
      min_trigger_frequency: min_trigger_frequency,
      trigger_window: trigger_window,
      max_length: max_length,
      compression: compression,
      recording_start: recording_start_string,
      recording_stop: recording_stop_string,
      comments: comments
    )


    redirect_to deployments_path, notice: 'Deployment Successfully Updated'
    return    
  end

  def destroy
    result = Deployment.destroy(params[:id])
    redirect_to deployments_path, notice: 'Deployment Successfully Deleted'
  end
end
