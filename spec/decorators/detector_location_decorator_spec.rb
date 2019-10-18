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
      expect(detector_location.coordinates).to eql("#{detector_location.latitude}, #{detector_location.longitude}")
    end
  end

  describe '#quad_id' do
    it 'returns quad id from parsed location name' do
      expect(detector_location.quad_id).to eq('NE')
    end
  end

  describe '#quad_number' do
    let(:detector_location_without_quad_number) do
      build(:detector_location, location_name: '123456_NE').decorate
    end

    it 'returns quad_number if number is present' do
      expect(detector_location.quad_number).to eq('2')
    end

    it 'returns "1" if number is not present' do
      expect(detector_location_without_quad_number.quad_number).to eq('1')
    end
  end

  describe '#datum' do
    let(:detector_location_with_datum) do
      build(:detector_location, geodetic_system: build(:geodetic_system)).decorate
    end

    it 'returns default if geodetic system is not present' do
      expect(detector_location.datum).to eq('NAD83')
    end

    it 'returns datum if present' do
      expect(detector_location_with_datum.datum).to eq('WGS 84')
    end
  end
end
