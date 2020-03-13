# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TargetDescriptor, type: :model do
  let(:target_descriptor) { FactoryBot.build_stubbed(:target_descriptor) }
  let(:target_descriptor_with_detector_locations) { FactoryBot.build_stubbed(:target_descriptor, :has_detector_locations) }

  describe 'Target Descriptor Validation' do
    context 'An target descriptor is valid if' do
      it 'It has a label' do
        target_descriptor.label = 'FAKE LABEL'

        expect(target_descriptor).to be_valid
      end
    end

    context 'An target descriptor is invalid if' do
      it 'It has no label' do
        target_descriptor.label = ''

        expect(target_descriptor).to_not be_valid
      end
    end
  end

  describe 'Target Descriptor Functionality' do
    context 'Detection Target Interactions' do
      it 'A target descriptor can fetch the detection targets associated with it' do
        expect(target_descriptor.detection_target.class).to be(DetectionTarget)
      end
    end

    context 'Detector Locations Interactions' do
      it 'A target descriptor can fetch all of its detector locations' do
        expect(target_descriptor_with_detector_locations.detector_locations.length).to eq(5)
      end
    end

    context 'Detection Target Interactions' do
      it 'A target descriptor can fetch the detection target it is associated with' do
        expect(target_descriptor.detection_target.class).to be(DetectionTarget)
      end
    end
  end
end
