# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SamplingFrequency, type: :model do
  let(:sampling_frequency) { FactoryBot.build_stubbed(:sampling_frequency) }

  describe 'Sampling Frequency Validation' do
    context 'A sampling frequency is valid if' do
      it "It has a frequency that's a float" do
        sampling_frequency.frequency = 4.2

        expect(sampling_frequency).to be_valid
      end
    end

    context 'A sampling frequency is invalid if' do
      it "It has a frequency that isn't a float" do
        sampling_frequency.frequency = nil

        expect(sampling_frequency).to_not be_valid

        sampling_frequency.frequency = 'INVALID'

        expect(sampling_frequency).to_not be_valid
      end

      it 'It has a frequency of zero' do
        sampling_frequency.frequency = 0

        expect(sampling_frequency).to_not be_valid
      end
    end
  end
end
