# frozen_string_literal: true

class CommitUpload
  attr_accessor :data

  def initialize(data = nil)
    @data = data
  end

  def run
    create_detector_locations
  end

  private

  # def create_detectors
  #   long_name = {
  #     'Oregon State University-Cascades' => 'OSU',
  #     'National Park Service' => 'NPS',
  #     'Oregon Department of Fish and Wildlife' => 'ODFW',
  #     'Bureau of Land Management' => 'BLM',
  #     'United States Forest Service' => 'USFS'
  #   }

  #   long_name.default = 'Other'

  #   data.each do |row|
  #     current_serial_number = row['Detector Serial No.']

  #     next if current_serial_number.nil?

  #     existing_detector = Detector.find_by(serial_number: row['Detector Serial No.'])

  #     next unless existing_detector.nil?

  #     organization_name = long_name[row['Deployment Agency']]

  #     organization = Organization.find_by(name: organization_name)

  #     detector_manufacturer = row['Detector Model'].split
  #     detector_model = detector_manufacturer.pop

  #     if existing_detector.nil?
  #       Detector.create!(firmware: 'UNSET', manufacturer: detector_manufacturer.join(' '), model: detector_model, serial_number: current_serial_number, organization_id: organization.id)
  #     end
  #   end
  # end

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
end
