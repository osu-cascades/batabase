require 'rails_helper'

RSpec.describe DetectorLocationDecorator do
  let(:detection_target) { build(:detection_target) }
  let(:detector_location) { build(:detector_location, detection_target: detection_target).decorate }

  describe '#detection_target_label' do
    it 'returns detection target label' do
      expect(detector_location.detection_target_label).to eql('Example Detection Target')
    end
  end
end
