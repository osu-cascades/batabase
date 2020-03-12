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

  def create_detectors
    long_name = {
      'Oregon State University-Cascades' => 'OSU',
      'National Park Service' => 'NPS',
      'Oregon Department of Fish and Wildlife' => 'ODFW',
      'Bureau of Land Management' => 'BLM',
      'United States Forest Service' => 'USFS'
    }

    long_name.default = 'Other'

    data.each do |row|
      current_serial_number = row['Detector Serial No.']

      next if current_serial_number.nil?

      existing_detector = Detector.find_by(serial_number: row['Detector Serial No.'])

      next unless existing_detector.nil?

      organization_name = long_name[row['Deployment Agency']]

      organization = Organization.find_by(name: organization_name)

      detector_manufacturer = row['Detector Model'].split
      detector_model = detector_manufacturer.pop

      if existing_detector.nil?
        Detector.create!(firmware: 'UNSET', manufacturer: detector_manufacturer.join(' '), model: detector_model, serial_number: current_serial_number, organization_id: organization.id)
      end
    end
  end

  def create_contacts
    data.each do |row|
      next if row['Deployment Contact'].nil?

      current_contact_name = row['Deployment Contact'].split

      if current_contact_name.length != 1
        current_contact_last_name = current_contact_name.pop
      else
        current_contact_last_name = '';
      end

      existing_contact = Contact.find_by(first_name: current_contact_name[0])

      next unless existing_contact.nil?

      current_organization_name = row['Deployment Agency']
      current_organization = Organization.find_by(name: current_organization_name)

      next if current_organization.nil?

      current_sample_unit_code = row['Location ID'].split('_')

      current_sample_unit = SampleUnit.find_by(code: current_sample_unit_code[0].to_i)

      next if current_sample_unit.nil?
      
      current_state = current_sample_unit.primary_state.state

      Contact.create!(
        first_name: current_contact_name[0], 
        last_name: current_contact_last_name, 
        state_id: current_state.id,
        organization_id: current_organization.id,
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
      "river" => "river",
      "stream" => "stream",
      "spring" => "spring",
      "lake" => "lake",
      "pond" => "pond",
      "wetland" => "wetland",
      "stocktank/trough" => "stocktank/trough",
      "largecanyonbottom" => "large canyon bottom",
      "largecanyontop" => "large canyon top",
      "smallarroyodrygulchbottom" => "small arroyo dry gulch bottom",
      "smallarroyodrygulchtop" => "small arroyo dry gulch top",
      "ridgetop" => "ridge top",
      "cliffbottom" => "cliff bottom",
      "clifftop" => "cliff top",
      "large" => "large",
      "medium" => "medium",
      "small" => "small",
      "oldyoungforest" => "old young forest",
      "forestopenland" => "forest open land",
      "smallgap" => "small gap",
      "trail" => "trail",
      "roadway" => "roadway",
      "other" => "other"
    }

    data.each do |row|
      next if row['Location ID'].nil?

      current_location_id = row['Location ID']

      existing_detector_location = DetectorLocation.find_by(location_identifier: row['Location ID'].upcase)
      next unless existing_detector_location.nil?

      current_sample_unit_code = row['Location ID'].split('_')

      current_sample_unit = SampleUnit.find_by(code: current_sample_unit_code[0].to_i)
      next if current_sample_unit.nil?

      current_habitat_label = local_habitat_names[row['Habitat (choose one)']];
      next if current_habitat_label.nil?

      current_local_habitat = LocalHabitat.find_by(label: current_habitat_label)
      
      next if current_local_habitat.nil?

      current_quad_number = current_location_id.split('').pop
      current_quad_id = current_location_id[-3, 2].upcase


      current_location_name = row['Site Name']
      if current_location_name == nil
        current_location_name = ''
      end

      current_land_ownership = row['Land Ownership']
      if current_land_ownership == nil
        current_land_ownership = ''
      end

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

      if current_target_descriptor.id == nil
        next
      end

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
      next if row['Location ID'].nil?

      current_location_id = row['Location ID']
      current_detector_location = DetectorLocation.find_by(location_identifier: row['Location ID'].upcase)
      next if current_detector_location.nil?

      current_clutter_type_name = row['Clutter Type']
      current_other_clutter_type_name = row['Enter other Clutter Type']

      next if current_clutter_type_name.nil?

      if current_other_clutter_type_name == nil
        current_clutter_type = ClutterType.find_by(name: current_clutter_type_name.capitalize)
        if current_clutter_type == nil
          current_clutter_type = ClutterType.create(name: current_clutter_type_name)
        end
      else
        current_clutter_type = ClutterType.find_by(
          name: "#{current_clutter_type_name.capitalize}, #{current_other_clutter_type_name.capitalize}"
        )
        
        if current_clutter_type == nil
          current_clutter_type = ClutterType.create(name: "#{current_clutter_type_name.capitalize}, #{current_other_clutter_type_name.capitalize}")
        end
      end

      current_distance_range_label = convert_distance_to_clutter_to_distance_range(row['Distance to Clutter (m)'].to_i)
      current_distance_range = DistanceRange.find_by(label: current_distance_range_label);


      # Making default clutter percent until we know where that comes from
      default_clutter_perecent = ClutterPercent.find_by(label: "0%")


      current_detector_serial_number = row['Detector Serial No.']

      next if current_detector_serial_number.nil?
      current_detector = Detector.find_by(serial_number: current_detector_serial_number)
      next if current_detector.nil?

      #TODO: figure out how to parse distance ranges

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

      if row['SAMP. FREQ'] != nil
        current_sample_frequency = row['SAMP. FREQ']
      else
        current_sample_frequency = 500
      end

      if row['PRETRIG'] != nil
        current_pre_trigger = row['PRETRIG']
      else
        current_pre_trigger = "OFF"
      end

      if row['REC. LEN'] != nil
        current_recording_length = row['REC. LEN']
      else
        current_recording_length = "5"
      end

      if row['HP-FILTER'] != nil
       current_hp_filter = row['HP-FILTER']
      else
        current_hp_filter = "NO"
      end

      if row['AUTOREC'] != nil
        current_auto_record = row['AUTOREC']
      else
        current_auto_record = "YES"
      end

      if row['T. SENSE'] != nil
        current_trigger_sensitivity = row['T. SENSE']
      else
        current_trigger_sensitivity = "MED"
      end

      if row['INPUT GAIN'] != nil
        current_input_gain = row['INPUT GAIN']
      else
        current_input_gain = 45
      end

      if row['TRIG LEV'] != nil
        current_trigger_level = row['TRIG LEV']
      else
        current_trigger_level = "160"
      end

      if row['INTERVAL'] != nil
        current_interval = row['INTERVAL']
      else
        current_interval = 0
      end

      if row['TIMER ON'] != nil
        current_recording_start = convert_string_date_to_datetime(row['TIMER ON'])
      else
        current_recording_start = nil
      end

      if row['TIMER OFF'] != nil
        current_recording_stop = convert_string_date_to_datetime(row['TIMER OFF'])
      else
        current_recording_stop = nil
      end

      if row['Comments'] != nil
        current_comments = row['Comments']
      else
        current_comments = ''
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
    
    time = DateTime.parse(time_val).strftime("%H:%M:%S")
    time_vals = time.split(':')



    datetime = DateTime.new(
      date_vals[2].to_i, 
      date_vals[0].to_i, 
      date_vals[1].to_i,
      time_vals[0].to_i,
      time_vals[1].to_i,
      time_vals[2].to_i
    )

    return datetime
  end

  def convert_distance_to_clutter_to_distance_range(distance)

    case distance
    when 0..4
      result = "< 5m"
    when 5
      result = "5m"
    when 6..9
      result = "5-10m"
    when 10
      result = "10m"
    when 11..14
      result = "10-15m"
    when 15
      result = "15m"
    when 16..19
      result = "15-20m"
    when 20
      result = "20m"
    when 21..29
      result = "20-30m"
    when 30..40
      result = "30-40m"
    when 41..49
      result = "40-50m"
    when 50
      result = "50m"
    when 51-60
      result = "50-60m"
    when 61..70
      result = "60-70m"
    when 75
      result = "75m"
    when 71..80
      result = "70-80m"
    when 81..90
      result = "80-90m"
    when 100
      result = "100m"
    when distance > 100
      result = "> 100m"
    else
      result = "Unknown"
    end

    return result
  end
  
end
