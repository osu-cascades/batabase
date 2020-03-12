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

  column(:deployment_date)
  column(:recovery_date)
  column(:primary_contact, header: "Primary Contact") do |deployment|
    "#{deployment.primary_contact.first_name} #{deployment.primary_contact.last_name}"
  end
  column(:recovery_contact, header: "Recovery Contact") do |deployment|
    "#{deployment.recovery_contact.first_name} #{deployment.recovery_contact.last_name}"
  end
  column(:comments)
  column(:microphone_height_off_ground)
  column(:microphone_orientation)
  column(:sampling_frequency)
  column(:pre_trigger)
  column(:recording_length)
  column(:hp_filter)
  column(:auto_record)
  column(:trigger_sensitivity)
  column(:input_gain)
  column(:trigger_level)
  column(:interval)
  column(:gain)
  column(:sixteen_thousand_high_filter)
  column(:sample_rate)
  column(:min_duration)
  column(:min_trigger_frequency)
  column(:trigger_window)
  column(:max_length)
  column(:compression)
  column(:recording_start)
  column(:recording_stop)
  column(:detector_location, header: "Quad ID") do |deployment|
    deployment.detector_location.quad_id
  end
  column(:detector_location, header: "Quad Number") do |deployment|
    deployment.detector_location.quad_no
  end
  column(:detector_location, header: "Location ID") do |deployment|
    deployment.detector_location.location_identifier
  end
  column(:detector_location, header: "Location Name") do |deployment|
    deployment.detector_location.location_name
  end
  column(:detector_location, header: "Latitude") do |deployment|
    deployment.detector_location.latitude
  end
  column(:detector_location, header: "Longitude") do |deployment|
    deployment.detector_location.longitude
  end
  column(:detector_location, header: "Elevation") do |deployment|
    deployment.detector_location.elevation
  end
  column(:detector_location, header: "Driving Directions") do |deployment|
    deployment.detector_location.driving_directions
  end
  column(:detector_location, header: "Land Ownership") do |deployment|
    deployment.detector_location.land_ownership
  end
  column(:detector_location, header: "Land Ownership") do |deployment|
    deployment.detector_location.land_ownership
  end
  column(:detector, header: "Firmware") do |deployment|
    deployment.detector.firmware
  end
  column(:detector, header: "Manufacturer") do |deployment|
    deployment.detector.manufacturer
  end
  column(:detector, header: "Model") do |deployment|
    deployment.detector.model
  end
  column(:detector, header: "Serial Number") do |deployment|
    deployment.detector.serial_number
  end
  column(:clutter_type, header: "Clutter Type") do |deployment|
    deployment.clutter_type.name
  end
  column(:clutter_percent, header: "Clutter %") do |deployment|
    deployment.clutter_percent.label
  end
  column(:distance_range, header: "Distance Range") { |dep| dep.distance_range.label }
end