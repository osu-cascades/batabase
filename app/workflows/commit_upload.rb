# frozen_string_literal: true

class CommitUpload
  attr_accessor :data

  def initialize(data = nil)
    @data = data
  end

  def run
    create_detectors
    create_contacts
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

  #   long_name.default = 'Other'
    data.each do |row|
      next if row['Location ID'].nil?

      current_location_id = row['Location ID']

      existing_detector_location = DetectorLocation.find_by(location_identifier: row['Location ID'].upcase)
      next unless existing_detector_location.nil?

      current_sample_unit_code = row['Location ID'].split('_')

      current_sample_unit = SampleUnit.find_by(code: current_sample_unit_code[0].to_i)
      next if current_sample_unit.nil?

      # next if row['Habitat (Choose One)'].nil?
      current_habitat_label = local_habitat_names[row['Habitat (choose one)']];
      next if current_habitat_label.nil?
      #TODO: either change seeded data to omit spaces or translate labels 
      current_local_habitat = LocalHabitat.find_by(current_habitat_label)
      
      byebug
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
    end
  end
end
