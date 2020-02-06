# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Software, type: :model do
  let(:software) { FactoryBot.build_stubbed(:software, :sonobat) }
  let(:software_using_defaults) { FactoryBot.create(:default_software) }

  describe 'Software Validation' do
    context 'Software is valid if' do
      it 'It has a name of Sonobat 4 or Kaleidoscope' do
        software.name = 'Sonobat 4'

        expect(software).to be_valid

        software.name = 'Kaleidoscope'

        expect(software).to be_valid
      end

      it 'It has an acceptable call quality that is a number' do
        software.acceptable_call_quality = 0.50

        expect(software).to be_valid
      end

      it 'It has a sequence decision threshold that is a number' do
        software.sequence_decision_threshold = 0.80

        expect(software).to be_valid
      end

      it 'It has a max number of calls that is a whole number' do
        software.max_no_calls = 30

        expect(software).to be_valid
      end
    end

    context 'Software is invalid if' do
      it 'It has no name' do
        software.name = ''

        expect(software).to_not be_valid
      end

      it 'It has name that isn\'t Sonobat 4 or Kaleidoscope' do
        software.name = 'Sonobat 3'

        expect(software).to_not be_valid

        software.name = 'Caleidoscope'

        expect(software).to_not be_valid
      end

      it 'It has a non numeric acceptable call quality' do
        software.acceptable_call_quality = 'very good call'

        expect(software).to_not be_valid
      end

      it 'It has a non numeric sequence decision threshold call quality' do
        software.sequence_decision_threshold = 'high'

        expect(software).to_not be_valid
      end

      it 'It has a max number of calls that isn\'t a whole number' do
        software.max_no_calls = 0.5

        expect(software).to_not be_valid 
      end
    end
  end

  # describe 'Software default behavior' do
  #   context 'Software default values' do
  #     it 'It should have a default value for acceptable call quality upon creation' do
  #       expected_quality = 0.80

  #       expect(software_using_defaults.acceptable_call_quality).to eq expected_quality
  #     end
  #   end
  # end
end
