require 'rails_helper'

RSpec.describe DetectorLocationDecorator do
  let(:detection_target) { build(:detection_target) }
  let(:detector_location) { build(:detector_location, detection_target: detection_target).decorate }

  describe '#detection_target_label' do
    it 'returns detection target label' do
      expect(detector_location.detection_target_label).to eql('Example Detection Target')
    end
  end

  describe '#coordinates' do
    it 'returns formatted coordinates' do
      expect(detector_location.coordinates).to eql("[#{detector_location.latitude}, #{detector_location.longitude}]")
    end
  end
end

# sample_unit
# location_name { 'Example Location Name' }
# latitude { 44.4444444}
# longitude { -121.121121 }
# elevation { 3000 }
# land_ownership { 'Example Ownership' }

# def coordinates
#   "[#{latitude}, #{longitude}]"
# end