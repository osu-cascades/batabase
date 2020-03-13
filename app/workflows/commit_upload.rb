# frozen_string_literal: true

class CommitUpload
  attr_accessor :data

  def initialize(data = nil)
    @data = data
  end

  def run
    create_contacts
    create_detector_locations
    create_deployments
  end

  private

  def create_contacts
    data.each do |row|
      next if row['Deployment Contact'].nil?

      current_contact_name = row['Deployment Contact'].split

      current_contact_last_name =
        if current_contact_name.length > 1
          current_contact_name.pop
        else
          'LEFT BLANK'
        end

      existing_contact = Contact.find_by(first_name: current_contact_name.first)

      next unless existing_contact.nil?

      current_organization_name = row['Deployment Agency']
      current_organization = Organization.find_by(name: current_organization_name)

      next if current_organization.nil?

      current_sample_unit_code = row['Location ID'].split('_')

      current_sample_unit = SampleUnit.find_by(code: current_sample_unit_code[0].to_i)

      next if current_sample_unit.nil?

      current_state = current_sample_unit.primary_state.state

      Contact.create!(
        first_name: current_contact_name.first,
        last_name: current_contact_last_name,
        state_id: current_state.id,
        organization_id: current_organization.id
      )
    end
  end

  def create_detector_locations
    local_habitat_names = {
      'mixedconifer' => 'mixed conifer',
      'dryconifer' => 'dry conifer',
      'alpineforest' => 'alpine forest',
      'mesicforest' => 'mesic forest',
      'urban' => 'urban',
      'agriculture' => 'agriculture',
      'grassland' => 'grassland',
      'shrub-steppe' => 'shrub-steppe'
    }

    target_descriptor_names = {
      'river' => 'river',
      'stream' => 'stream',
      'spring' => 'spring',
      'lake' => 'lake',
      'pond' => 'pond',
      'wetland' => 'wetland',
      'stocktank/trough' => 'stocktank/trough',
      'largecanyonbottom' => 'large canyon bottom',
      'largecanyontop' => 'large canyon top',
      'smallarroyodrygulchbottom' => 'small arroyo dry gulch bottom',
      'smallarroyodrygulchtop' => 'small arroyo dry gulch top',
      'ridgetop' => 'ridge top',
      'cliffbottom' => 'cliff bottom',
      'clifftop' => 'cliff top',
      'large' => 'large',
      'medium' => 'medium',
      'small' => 'small',
      'oldyoungforest' => 'old young forest',
      'forestopenland' => 'forest open land',
      'smallgap' => 'small gap',
      'trail' => 'trail',
      'roadway' => 'roadway',
      'other' => 'other'
    }

    data.each do |row|
      next if row['Location ID'].nil?

      current_location_id = row['Location ID']

      existing_detector_location = DetectorLocation.find_by(location_identifier: row['Location ID'].upcase)
      next unless existing_detector_location.nil?

      current_sample_unit_code = row['Location ID'].split('_')

      current_sample_unit = SampleUnit.find_by(code: current_sample_unit_code[0].to_i)
      next if current_sample_unit.nil?

      current_habitat_label = local_habitat_names[row['Habitat (choose one)']]
      next if current_habitat_label.nil?

      current_local_habitat = LocalHabitat.find_by(label: current_habitat_label)

      next if current_local_habitat.nil?

      current_quad_number = current_location_id.split('').pop
      current_quad_id = current_location_id[-3, 2].upcase

      current_location_name = row['Site Name']
      current_location_name = '' if current_location_name.nil?

      current_land_ownership = row['Land Ownership']
      current_land_ownership = '' if current_land_ownership.nil?

      current_driving_directions = row['Directions to Site']

      if row['Waterbody']
        current_detection_target = DetectionTarget.find_by(label: 'waterbody')
        current_target_descriptor = TargetDescriptor.find_by(label: target_descriptor_names[row['Waterbody']])
      elsif row['Dry Water Feature']
        current_detection_target = DetectionTarget.find_by(label: 'drywater')
        current_target_descriptor = TargetDescriptor.find_by(label: target_descriptor_names[row['Dry Water Feature']])
      elsif row['Rock Feature']
        current_detection_target = DetectionTarget.find_by(label: 'rock')
        current_target_descriptor = TargetDescriptor.find_by(label: target_descriptor_names[row['Rock Feature']])
      elsif row['Meadow']
        current_detection_target = DetectionTarget.find_by(label: 'meadow')
        current_target_descriptor = TargetDescriptor.find_by(label: target_descriptor_names[row['Meadow']])
      elsif row['Forest Edge']
        current_detection_target = DetectionTarget.find_by(label: 'forestedge')
        current_target_descriptor = TargetDescriptor.find_by(label: target_descriptor_names[row['Forest Edge']])
      elsif row['Forest Opening']
        current_detection_target = DetectionTarget.find_by(label: 'forestopening')
        current_target_descriptor = TargetDescriptor.find_by(label: target_descriptor_names[row['Forest Opening']])
      elsif row['Other Detection Target (if none of the above)']
        current_detection_target = DetectionTarget.find_by(label: 'other')
        current_target_descriptor = TargetDescriptor.create(detection_target_id: current_detection_target.id, label: target_descriptor_names[row['Other Detection Target (if none of the above)']])
      else
        next
      end

      next if current_target_descriptor.id.nil?

      current_latitude = row['x']
      current_longitude = row['y']

      DetectorLocation.create!(
        quad_id: current_quad_id,
        quad_no: current_quad_number,
        location_name: current_location_name,
        latitude: current_latitude,
        longitude: current_longitude,
        driving_directions: current_driving_directions,
        land_ownership: current_land_ownership,
        sample_unit_id: current_sample_unit.id,
        local_habitat_id: current_local_habitat.id,
        detection_target_id: current_detection_target.id,
        target_descriptor_id: current_target_descriptor.id
      )
    end
  end

  def create_deployments
    data.each do |row|
      current_location_id = row['Location ID']

      next if current_location_id.nil?

      current_detector_location = DetectorLocation.find_by(location_identifier: current_location_id.upcase)
      next if current_detector_location.nil?

      current_clutter_type_name = row['Clutter Type']
      current_other_clutter_type_name = row['Enter other Clutter Type']

      next if current_clutter_type_name.nil?

      if current_other_clutter_type_name.nil?
        current_clutter_type = ClutterType.find_by(name: current_clutter_type_name.capitalize)
        current_clutter_type = ClutterType.create(name: current_clutter_type_name) if current_clutter_type.nil?
      else
        current_clutter_type = ClutterType.find_by(
          name: "#{current_clutter_type_name.capitalize}, #{current_other_clutter_type_name.capitalize}"
        )

        if current_clutter_type.nil?
          current_clutter_type = ClutterType.create(name: "#{current_clutter_type_name.capitalize}, #{current_other_clutter_type_name.capitalize}")
        end
      end

      current_distance_range_label = convert_distance_to_clutter_to_distance_range(row['Distance to Clutter (m)'].to_i)
      current_distance_range = DistanceRange.find_by(label: current_distance_range_label)

      # Making default clutter percent until we know where that comes from
      default_clutter_perecent = ClutterPercent.find_by(label: '0%')

      current_detector_serial_number = row['Detector Serial No.']

      next if current_detector_serial_number.nil?

      current_detector = Detector.find_by(serial_number: current_detector_serial_number)
      next if current_detector.nil?

      current_deployment_date_string = row['Deployment Date']
      next if current_deployment_date_string.nil?

      current_deployment_date = convert_string_date_to_datetime(row['Deployment Date'])

      current_recovery_date_string = row['Recovery Date']
      next if current_recovery_date_string.nil?

      current_recovery_date = convert_string_date_to_datetime(row['Recovery Date'])

      current_primary_contact_name = row['Deployment Contact'].split
      current_primary_contact = Contact.find_by(first_name: current_primary_contact_name[0])

      current_microphone_height = row['Microphone Height (m)'].to_d
      current_microphone_orientation = row['Microphone Orientation']

      current_sample_frequency =
        if row['SAMP. FREQ'] != nil
          row['SAMP. FREQ']
        else
          500
        end

      current_pre_trigger =
        if !row['PRETRIG'].nil?
          row['PRETRIG']
        else
          'OFF'
        end

      current_recording_length =
        if row['REC. LEN'] != nil
          row['REC. LEN']
        else
          '5'
        end

      current_hp_filter =
        if !row['HP-FILTER'].nil?
          row['HP-FILTER']
        else
          'NO'
        end

      current_auto_record =
        if !row['AUTOREC'].nil?
          row['AUTOREC']
        else
          'YES'
        end

      current_trigger_sensitivity =
        if row['T. SENSE'] != nil
          row['T. SENSE']
        else
          'MED'
        end

      current_input_gain =
        if row['INPUT GAIN'] != nil
          row['INPUT GAIN']
        else
          45
        end

      current_trigger_level =
        if row['TRIG LEV'] != nil
          row['TRIG LEV']
        else
          '160'
        end

      current_interval =
        if !row['INTERVAL'].nil?
          row['INTERVAL']
        else
          0
        end

      current_recording_start = (convert_string_date_to_datetime(row['TIMER ON']) if row['TIMER ON'] != nil)

      current_recording_stop = (convert_string_date_to_datetime(row['TIMER OFF']) if row['TIMER OFF'] != nil)

      current_comments =
        if !row['Comments'].nil?
          row['Comments']
        else
          ''
        end

      Deployment.create!(
        detector_location_id: current_detector_location.id,
        clutter_type_id: current_clutter_type.id,
        clutter_percent_id: default_clutter_perecent.id,
        distance_range_id: current_distance_range.id,
        detector_id: current_detector.id,
        deployment_date: current_deployment_date,
        recovery_date: current_recovery_date,
        primary_contact_id: current_primary_contact.id,
        recovery_contact_id: current_primary_contact.id, # TODO: this needs to be resolved to a real recovery contact
        microphone_height_off_ground: current_microphone_height,
        microphone_orientation: current_microphone_orientation,
        sampling_frequency: current_sample_frequency,
        pre_trigger: current_pre_trigger,
        recording_length: current_recording_length,
        hp_filter: current_hp_filter,
        auto_record: current_auto_record,
        trigger_sensitivity: current_trigger_sensitivity,
        input_gain: current_input_gain,
        trigger_level: current_trigger_level,
        interval: current_interval,
        recording_start: current_recording_start,
        recording_stop: current_recording_stop,
        comments: current_comments
      )
    end
  end

  # Just a helper to convert the fields to correct type
  def convert_string_date_to_datetime(string_date)
    date_list = string_date.split(' ')

    date_vals = date_list[0].split('/')
    time_val = date_list[1] + date_list[2]

    time = DateTime.parse(time_val).strftime('%H:%M:%S')
    time_vals = time.split(':')

    datetime = DateTime.new(
      date_vals[2].to_i,
      date_vals[0].to_i,
      date_vals[1].to_i,
      time_vals[0].to_i,
      time_vals[1].to_i,
      time_vals[2].to_i
    )

    datetime
  end

  def convert_distance_to_clutter_to_distance_range(distance)
    result = case distance
             when 0..4
               '< 5m'
             when 5
               '5m'
             when 6..9
               '5-10m'
             when 10
               '10m'
             when 11..14
               '10-15m'
             when 15
               '15m'
             when 16..19
               '15-20m'
             when 20
               '20m'
             when 21..29
               '20-30m'
             when 30..40
               '30-40m'
             when 41..49
               '40-50m'
             when 50
               '50m'
             when 51 - 60
               '50-60m'
             when 61..70
               '60-70m'
             when 75
               '75m'
             when 71..80
               '70-80m'
             when 81..90
               '80-90m'
             when 100
               '100m'
             when distance > 100
               '> 100m'
             else
               'Unknown'
             end

    result
  end
end
