# frozen_string_literal: true

class DeploymentsGrid
  include Datagrid

  scope do
    Deployment.includes(
      :detector_location,
      :detector,
      :distance_range,
      :clutter_type,
      :clutter_percent,
      :primary_contact,
      :recovery_contact
    )
  end

  filter(:microphone_height_off_ground, :float, header: 'Microphone Height')
  filter(:microphone_orientation, :string, header: 'Microphone Orientation')
  filter(:sampling_frequency, :integer, header: 'Sampling Frequency')
  filter(:pre_trigger, :string, header: 'Pre Trigger')
  filter(:recording_length, :string, header: 'Recording Length')
  filter(:hp_filter, :string, header: 'High Pass Filter')
  filter(:auto_record, :string, header: 'Auto Record')
  filter(:trigger_sensitivity, :string, header: 'Trigger Sensitivity')
  filter(:input_gain, :integer, header: 'Input Gain')
  filter(:trigger_level, :string, header: 'Trigger Level')
  filter(:interval, :integer)
  filter(:gain, :integer)
  filter(:sixteen_thousand_high_filter, :string, header: '16k Filter')
  filter(:sample_rate, :integer, header: 'Sample Rate')
  filter(:min_duration, :string, header: 'Min Duration')
  filter(:max_duration, :string, header: 'Max Duration')
  filter(:min_trigger_frequency, :integer, header: 'Min Trigger Freq')
  filter(:trigger_window, :integer, header: 'Trigger Window')
  filter(:max_length, :string, header: 'Max Length')
  filter(:compression, :string)

  column_names_filter(header: 'Extra Columns', checkboxes: true)

  column(:deployment_date, mandatory: true)
  column(:recovery_date, mandatory: true)
  column(:primary_contact, header: 'Primary Contact', mandatory: true) do |deployment|
    "#{deployment.primary_contact.first_name} #{deployment.primary_contact.last_name}"
  end
  column(:recovery_contact, header: 'Recovery Contact', mandatory: true) do |deployment|
    "#{deployment.recovery_contact.first_name} #{deployment.recovery_contact.last_name}"
  end
  column(:comments, mandatory: true)
  column(:microphone_height_off_ground, mandatory: true)
  column(:microphone_orientation, mandatory: true)
  column(:sampling_frequency, mandatory: true)
  column(:pre_trigger, mandatory: true)
  column(:recording_length, mandatory: true)
  column(:hp_filter, mandatory: true)
  column(:auto_record, mandatory: true)
  column(:trigger_sensitivity, mandatory: true)
  column(:input_gain, mandatory: true)
  column(:trigger_level, mandatory: true)
  column(:interval, mandatory: true)
  column(:gain, mandatory: true)
  column(:sixteen_thousand_high_filter, mandatory: true)
  column(:sample_rate, mandatory: true)
  column(:min_duration, mandatory: true)
  column(:min_trigger_frequency, mandatory: true)
  column(:trigger_window, mandatory: true)
  column(:max_length, mandatory: true)
  column(:compression, mandatory: true)
  column(:recording_start, mandatory: true)
  column(:recording_stop, mandatory: true)

  column(:detector_location_quad_id, header: 'Quad ID') do |deployment|
    deployment.detector_location.quad_id
  end
  column(:detector_location_quad_no, header: 'Quad Number') do |deployment|
    deployment.detector_location.quad_no
  end
  column(:detector_location_location_identifier, header: 'Location ID') do |deployment|
    deployment.detector_location.location_identifier
  end
  column(:detector_location_location_name, header: 'Location Name') do |deployment|
    deployment.detector_location.location_name
  end
  column(:detector_location_latitude, header: 'Latitude') do |deployment|
    deployment.detector_location.latitude
  end
  column(:detector_location_longitude, header: 'Longitude') do |deployment|
    deployment.detector_location.longitude
  end
  column(:detector_location_elevation, header: 'Elevation') do |deployment|
    deployment.detector_location.elevation
  end
  column(:detector_location_driving_directions, header: 'Driving Directions') do |deployment|
    deployment.detector_location.driving_directions
  end
  column(:detector_location_land_ownership, header: 'Land Ownership') do |deployment|
    deployment.detector_location.land_ownership
  end
  column(:detector_firmware, header: 'Firmware') do |deployment|
    deployment.detector.firmware
  end
  column(:detector_manufacturer, header: 'Manufacturer') do |deployment|
    deployment.detector.manufacturer
  end
  column(:detector_model, header: 'Model') do |deployment|
    deployment.detector.model
  end
  column(:detector_serial_number, header: 'Serial Number') do |deployment|
    deployment.detector.serial_number
  end
  column(:clutter_type, header: 'Clutter Type') do |deployment|
    deployment.clutter_type.name
  end
  column(:clutter_percent, header: 'Clutter %') do |deployment|
    deployment.clutter_percent.label
  end
  column(:distance_range, header: 'Distance Range') { |dep| dep.distance_range.label }

  column(:edit, html: true, header: '', mandatory: true) do |deployment|
    link_to 'Edit', edit_deployment_path(deployment), class: "btn btn-primary"
  end

  column(:delete, html: true, header: '', mandatory: true) do |deployment|
    link_to 'Delete', deployment, method: 'delete', class: "btn btn-danger", data: { confirm: 'Are you sure?', disable_with: 'Deleting....' }
  end
end
