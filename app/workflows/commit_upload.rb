# frozen_string_literal: true

class CommitUpload
  attr_reader :data, :upload_type

  def initialize(data = nil, upload_type = nil)
    @data = data
    @upload_type = upload_type
  end

  def run
    if upload_type == 'Site Metadata'
      create_detectors
      create_contacts
      create_detector_locations
      create_deployments
    else
      create_sonobat_output
    end
  end

  private

  def create_detectors
    organization_names = Detector::ORGANIZATION_NAMES

    data.each do |row|
      current_serial_number = row['Detector Serial No.']
      next if current_serial_number.nil?

      existing_detector = Detector.find_by(serial_number: current_serial_number)
      next unless existing_detector.nil?

      current_firmware = 'Unknown' # can be backfilled later when uploading audio metadata

      current_detector_model = row['Detector Model'].split

      current_model = current_detector_model.pop
      current_manufacturer = current_detector_model.join(' ')

      current_organization_name = row['Deployment Agency']

      current_organization = Organization.find_by(name: organization_names[current_organization_name])

      next if current_organization.nil?

      Detector.create!(
        firmware: current_firmware,
        serial_number: current_serial_number,
        model: current_model,
        manufacturer: current_manufacturer,
        organization_id: current_organization.id
      )
    end
  end

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
    local_habitat_names = DetectorLocation::LOCAL_HABITAT_NAMES
    target_descriptor_names = DetectorLocation::TARGET_DESCRIPTOR_NAMES

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

      current_distance_range_label = Deployment.distance_to_distance_range(row['Distance to Clutter (m)'].to_i)
      current_distance_range = DistanceRange.find_by(label: current_distance_range_label)

      current_clutter_category = row['Clutter Category']
      current_clutter_percent = ClutterPercent.find_by(id: current_clutter_category)

      current_detector_serial_number = row['Detector Serial No.']

      next if current_detector_serial_number.nil?

      current_detector = Detector.find_by(serial_number: current_detector_serial_number)

      next if current_detector.nil?

      current_deployment_date_string = row['Deployment Date']

      next if current_deployment_date_string.nil?

      current_deployment_date = field_to_datetime(row['Deployment Date'])

      current_recovery_date_string = row['Recovery Date']

      next if current_recovery_date_string.nil?

      current_recovery_date = field_to_datetime(row['Recovery Date'])

      current_primary_contact_name = row['Deployment Contact'].split
      current_primary_contact = Contact.find_by(first_name: current_primary_contact_name[0])

      current_microphone_height = row['Microphone Height (m)'].to_d
      current_microphone_orientation = row['Microphone Orientation']

      current_comments = row['Comments'].nil? ? '' : row['Comments']

      current_sample_frequency = row['SAMP. FREQ'].nil? ? 500 : row['SAMP. FREQ (D500X)']
      current_pre_trigger = row['PRETRIG'].nil? ? 'OFF' : row['PRETRIG (D500X)']
      current_recording_length = row['REC. LEN'].nil? ? '5' : row['REC. LEN (D500X)']
      current_hp_filter = row['HP-FILTER'].nil? ? 'NO' : row['HP-FILTER (D500X)']
      current_auto_record = row['AUTOREC'].nil? ? 'YES' : row['AUTOREC (D500X)']
      current_trigger_sensitivity = row['T. SENSE (D500X)'].nil? ? 'MED' : row['T. SENSE (D500X)']
      current_input_gain = row['INPUT GAIN (D500X)'].nil? ? 45 : row['INPUT GAIN (D500X)']
      current_trigger_level = row['TRIG LEV (D500X)'].nil? ? '160' : row['TRIG LEV (D500X)']
      current_interval = row['INTERVAL (D500X)'].nil? ? 0 : row['INTERVAL (D500X)']
      current_gain = row['Gain (SM4BAT)']
      current_16k_filter = row['16K High Filter (SM4BAT)']
      current_sample_rate = row['Sample Rate (kHz) (SM4BAT)']
      current_min_duration = row['Min Duration (SM4BAT)']
      current_max_duration = row['Max Duration (SM4BAT)']
      current_min_trigger_freq = row['Min Trig Freq (kHz) (SM4BAT)']
      current_trigger_level ||= row['Trigger Level (dB) (SM4BAT)']
      current_trigger_window = row['Trigger Window (SM4BAT)']
      current_max_length = row['Max Length (sec) (SM4BAT)']
      current_compression = row['Compression (SM4BAT)']

      if current_detector.model == 'D500X'
        current_recording_start = row['TIMER ON (D500X)']
        current_recording_stop = row['TIMER OFF (D500X)']
      else
        current_recording_start = row['Start Time (SM4BAT)']
        current_recording_stop = row['End Time (SM4BAT)']
      end
      
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

        gain: current_gain,
        sixteen_thousand_high_filter: current_16k_filter,
        sample_rate: current_sample_rate,
        min_duration: current_min_duration,
        max_duration: current_max_duration,
        min_trigger_frequency: current_min_trigger_freq,
        trigger_window: current_trigger_window,
        max_length: current_max_length,
        compression: current_compression,
        recording_start: current_recording_start,
        recording_stop: current_recording_stop,
        comments: current_comments
      )
    end
  end

  # Just a helper to convert the fields to correct type
  def field_to_datetime(string_date)
    date_time = string_date.split(' ')

    date = date_time.first.split('/')

    time = date_time.last.split(':')

    datetime = DateTime.new(
      date[2].to_i,
      date[0].to_i,
      date[1].to_i,
      time[0].to_i,
      time[1].to_i,
      0
    )

    datetime
  end

  # def extract_detector_location_code_from(line filename)
  #   filename.each do |n|
  #     return n[/[0-9]{6}+_[A-Z]{2}/]
  # end

  def create_sonobat_output
    location_identifiers = data['ParentDir'].map { |i| i.split('_')[1..-1].join('_') }
    detector_locations = location_identifiers.uniq.to_h { |i| [i, DetectorLocation.find_by(location_identifier: i)] }

    deployments = {}
    detector_locations.each_pair { |key, value| deployments[key] = value.deployments }

    sonobat_outputs = []

    data.each_with_index do |line, index|
      # TODO: handle multiple records and clean the data during seeding so this works
      # current_deployment =
      #   if deployments[location_identifiers[index]].one?
      #     deployments[location_identifiers[index]]
      #   else
      #     deployments[location_identifiers[index]]
      #   end
      #call method that takes a filename for input
      #outputs the extracted detector_location_id
      #stores in the variable name detector_location_code
      #taking in all detector locations and comparing
      #to the extracted  detector location code
      #and assigning to detector location id
      # detector_location_id = detector_locations.filter({ |detector_locations| detector_locations.location_code == detector_location_code})



      sonobat_outputs.push(
        {
          night: line['MonitoringNight'],
          filename: line['Filename'],
          hi_f: line['HiF'],
          lo_f: line['LoF'],
          spp_accp: line['SppAccp'],
          prob: line['Prob'],
          maj: line['#Maj'],
          accp: line['#Accp'],
          spp: line['~Spp'],
          tilde_prob: line['~Prob'],
          fc_mean: line['Fc mean'],
          fc_std_dev: line['Fc StdDev'],
          dur_mean: line['Dur mean'],
          dur_std_dev: line['Dur StdDev'],
          calls_per_sec: line['calls/sec'],
          mean_hi_freq: line['mean HiFreq'],
          mean_lo_freq: line['mean LoFreq'],
          mean_uppr_slp: line['mean UpprSlp'],
          mean_lwr_slp: line['mean LwrSlp'],
          mean_total_slp: line['mean TotalSlp'],
          mean_preceding_intvl: line['mean PrecedingIntvl'],
          first: line['1st'],
          second: line['2nd'],
          third: line['3rd'],
          fourth: line['4th'],
          parent_dir: line['ParentDir'],
          next_dir_up: line['NextDirUp'],
          file_length: line['FileLength(sec)'],
          version: line['Version'],
          filter: line['Filter'],
          accp_quality: line['AccpQuality'],
          accp_qual_for_tally: line['AccpQualForTally'],
          max_calls_considered: line['Max#CallsConsidered'],
          manual_idspp1: line['Species Manual ID'],
          manual_idspp2: line['User|ManualIDSpp2'],
          notes: line['User|Comments'],
          deployment_id: deployments[location_identifiers[index]]
        }
      )
    end

    SonobatOutput.insert_all!(sonobat_outputs)
  end
end
