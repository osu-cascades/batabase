# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DetectionTarget, type: :model do
  let(:detection_target) { FactoryBot.build_stubbed(:detection_target) }
  let(:detection_target_with_target_descriptors) { FactoryBot.build_stubbed(:detection_target, :has_target_descriptors) }

  describe 'Detection Target Validation' do
    context 'An detection target is valid if' do
      it 'It has a label' do
        detection_target.label = 'FAKE LABEL'

        expect(detection_target).to be_valid
      end
    end

    context 'An detection target is invalid if' do
      it 'It has no label' do
        detection_target.label = ''

        expect(detection_target).to_not be_valid
      end
    end
  end

  describe 'Detection Target Functionality' do
    context 'Target Descriptor Interactions' do
      it 'A detection target can fetch all of the target descriptors associated with it' do
        detection_target_with_target_descriptors.target_descriptors.each do |target_descriptor|
          expect(target_descriptor.class).to be(TargetDescriptor)
        end

        expect(detection_target_with_target_descriptors.target_descriptors.length).to eq(5)
      end
    end

    context 'Detector Locations Interactions' do
      it 'A detection target can fetch the detector locations associated with it' do
        expect(detection_target.detector_location.class).to be(DetectorLocation)
      end
    end
  end
end
