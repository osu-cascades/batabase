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

      organization_names = {
        'Oregon State University-Cascades' => 'OSU',
        'National Park Service' => 'NPS',
        'Oregon Department of Fish and Wildlife' => 'ODFW',
        'Bureau of Land Management' => 'BLM',
        'United States Forest Service' => 'USFS'
      }

      organization_names.default = 'Other'

      current_organization_name = organization_names[row['Deployment Agency']]
      current_organization = Organization.find_by(name: current_organization_name)

      next if current_organization.nil?

      current_state_abbreviation = row['State']
      next if current_state_abbreviation.nil?

      current_state = State.find_by(abbreviation: current_state_abbreviation)
      next if current_state.nil?

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
      next if row['Location ID (Sample Unit + Unique Identifier (e.x "NE1")'].nil?

      current_location_id = row['Location ID (Sample Unit + Unique Identifier (e.x "NE1")']

      existing_detector_location = DetectorLocation.find_by(location_identifier: row['Location ID (Sample Unit + Unique Identifier (e.x "NE1")'].upcase)
      next unless existing_detector_location.nil?

      current_sample_unit_code = row['Location ID (Sample Unit + Unique Identifier (e.x "NE1")'].split('_')


      current_sample_unit = SampleUnit.find_by(code: current_sample_unit_code[0].to_i)
      next if current_sample_unit.nil?


      current_habitat_label = local_habitat_names[row['Habitat (choose one)']]
      next if current_habitat_label.nil?


      current_local_habitat = LocalHabitat.find_by(label: current_habitat_label)

      next if current_local_habitat.nil?

      current_quad_number = current_location_id.split('').pop
      current_quad_id = current_location_id[-3, 2].upcase

      current_location_name = row['Site Name'].nil? ? '' : row['Site Name']

      current_land_ownership = row['Land Ownership'].nil? ? '' : row['Land Ownership']

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

      current_latitude = row['Latitude']
      current_longitude = row['Longitude']

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
      current_location_id = row['Location ID (Sample Unit + Unique Identifier (e.x "NE1")']

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

      current_clutter_category = row['Clutter Category']
      current_clutter_percent = ClutterPercent.find_by(id: current_clutter_category)

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

      current_comments = row['Comments'].nil? ? '' : row['Comments']

      if current_detector.model == 'D500X'
        current_sample_frequency = row['SAMP. FREQ'].nil? ? 500 : row['SAMP. FREQ (D500X)']
        current_pre_trigger = row['PRETRIG'].nil? ? 'OFF' : row['PRETRIG (D500X)']
        current_recording_length = row['REC. LEN'].nil? ? '5' : row['REC. LEN (D500X)']
        current_hp_filter = row['HP-FILTER'].nil? ? 'NO' : row['HP-FILTER (D500X)']
        current_auto_record = row['AUTOREC'].nil? ? 'YES' : row['AUTOREC (D500X)']

        current_trigger_sensitivity = row['T. SENSE (D500X)'].nil? ? 'MED' : row['T. SENSE (D500X)']
        current_input_gain = row['INPUT GAIN (D500X)'].nil? ? 45 : row['INPUT GAIN (D500X)']
        current_trigger_level = row['TRIG LEV (D500X)'].nil? ? '160' : row['TRIG LEV (D500X)']
        current_interval = row['INTERVAL (D500X)'].nil? ? 0 : row['INTERVAL (D500X)']

        current_recording_start = row['TIMER ON (D500X)'].nil? ? '' : convert_string_date_to_datetime(row['TIMER ON (D500X)'])
        current_recording_stop = row['TIMER OFF (D500X)'].nil? ? '' : convert_string_date_to_datetime(row['TIMER OFF (D500X)'])


        Deployment.create!(
          detector_location_id: current_detector_location.id,
          clutter_type_id: current_clutter_type.id,
          clutter_percent_id: current_clutter_percent.id,
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

      # if current_detector.model == 'SM4BAT'
      #   current_gain = row['Gain (SM4BAT)']
      #   current_16k_filter = row['16K High Filter (SM4BAT)']
      #   current_sample_rate = row['Sample Rate (kHz) (SM4BAT)']
      #   current_min_duration = row['Min Duration (SM4BAT)']
      #   current_max_duration = row['Max Duration (SM4BAT)']
      #   current_min_trigger_freq = row['Min Trig Freq (kHz) (SM4BAT)']
      #   current_trigger_level = row['Trigger Level (dB) (SM4BAT)']
      #   current_trigger_window = row['Trigger Window (SM4BAT)']
      #   current_max_length = row['Max Length (sec) (SM4BAT)']
      #   current_compression = row['Compression (SM4BAT)']
      #   current_start_time = row['Start Time (SM4BAT)']
      #   currend_end_time = row['End Time (SM4BAT)']

      #   Deployment.create!(
      #     detector_location_id: current_detector_location.id,
      #     clutter_type_id: current_clutter_type.id,
      #     clutter_percent_id: default_clutter_perecent.id,
      #     distance_range_id: current_distance_range.id,
      #     detector_id: current_detector.id,
      #     deployment_date: current_deployment_date,
      #     recovery_date: current_recovery_date,
      #     primary_contact_id: current_primary_contact.id,
      #     recovery_contact_id: current_primary_contact.id, # TODO: this needs to be resolved to a real recovery contact
      #     microphone_height_off_ground: current_microphone_height,
      #     microphone_orientation: current_microphone_orientation,
      #     gain: current_gain
      #     sixteen_thousand_high_filter: current_16k_filter,
      #     sample_rate: current_sample_rate,
      #     min_duration: current_min_duration,
      #     max_duration: current_max_duration,
      #     min_trigger_frequency: current_min_trigger_freq,
      #     trigger_level: current_trigger_level,
      #     max_length: current_max_length,
      #     compression: current_compression,
      #     recording_start: current_start_time
      #     recording_stop: current_end_time,
      #     comments: current_comments
      #   )
      # end

      
    end
  end

  # Just a helper to convert the fields to correct type
  def convert_string_date_to_datetime(string_date)
    date_list = string_date.split(' ')

    date_vals = date_list[0].split('/')

    time_vals = date_list[1].split(':')

    datetime = DateTime.new(
      date_vals[2].to_i,
      date_vals[0].to_i,
      date_vals[1].to_i,
      time_vals[0].to_i,
      time_vals[1].to_i,
      0
    )

    datetime
  end

  def convert_distance_to_clutter_to_distance_range(distance)
    result =
      case distance
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
