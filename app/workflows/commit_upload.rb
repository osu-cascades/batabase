# frozen_string_literal: true

class CommitUpload
  attr_accessor :data

  def initialize(data = nil)
    @data = data
  end

  def run
    create_detectors
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
end
