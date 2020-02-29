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
    long_name = {
      'Oregon State University-Cascades' => 'OSU',
      'National Park Service' => 'NPS',
      'Oregon Department of Fish and Wildlife' => 'ODFW',
      'Bureau of Land Management' => 'BLM',
      'United States Forest Service' => 'USFS'
    }

    long_name.default = 'Other'

    data.each do |row|
      
      current_state = State.find_by(abbreviation: row['State'])

      next if row['Deployment Contact'].nil?

      current_contact_first_name = row['Deployment Contact'].split
      current_contact_last_name = current_contact_first_name.pop

      existing_contact = Contact.find_by(last_name: current_contact_last_name)

      next unless existing_contact.nil?

      current_organization_name = long_name[row['Deployment Agency']]
      current_organization = Organization.find_by(name: current_organization_name)

      Contact.create!(
        first_name: current_contact_first_name.join(' '), 
        last_name: current_contact_last_name, 
        state_id: current_state.id,
        organization_id: current_organization.id,
      )
    end
  end
end
