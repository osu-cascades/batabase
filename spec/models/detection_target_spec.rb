# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DetectionTarget, type: :model do
  let(:detection_target) { FactoryBot.build_stubbed(:detection_target) }

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
end
