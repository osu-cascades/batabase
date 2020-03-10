# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DistanceRange, type: :model do
  let(:distance_range) { FactoryBot.build_stubbed(:distance_range) }

  describe 'Distance Range Validation' do
    context 'Distance Range is valid if' do
      it 'It has a label' do
        distance_range.label = 'FAKE LABEL'

        expect(distance_range).to be_valid
      end
    end

    context 'Distance Range is invalid if' do
      it 'It contains no label' do
        distance_range.label = ''

        expect(distance_range).to_not be_valid
      end
    end
  end
end
