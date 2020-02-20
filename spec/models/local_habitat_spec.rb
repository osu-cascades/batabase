# frozen_string_literal: true

require 'csv'
require 'rails_helper'

RSpec.describe LocalHabitat, type: :model do
  let(:local_habitat) { FactoryBot.build_stubbed(:local_habitat, :mixed_conifer) }
  let(:local_habitat_with_detector_locations) { FactoryBot.build_stubbed(:local_habitat, :has_detector_locations) }

  describe 'Local Habitat Validation' do
    context 'Local habitat is valid if' do
      it 'It has a label' do
        VALID_LABELS = CSV.read(Rails.root.join('db/seed_data/local_habitats.csv'))

        VALID_LABELS.each do |label|
          local_habitat.label = label.first

          expect(local_habitat).to be_valid
        end
      end
    end

    context 'Local habitat is invalid if' do
      it 'It contains no label' do
        local_habitat.label = ''

        expect(local_habitat).to_not be_valid
      end

      it "It has a label that isn't pre-specified" do
        local_habitat.label = 'INVALID LABLE'

        expect(local_habitat).to_not be_valid
      end
    end
  end

  describe 'Local Habitat Functionality' do
    context 'Detector Location Interactions' do
      it 'A local habitat can fetch all of the detector locations associated with it' do
        local_habitat_with_detector_locations.detector_locations.each do |detector_location|
          expect(detector_location.class).to be(DetectorLocation)
        end

        expect(local_habitat_with_detector_locations.detector_locations.length).to eq(5)
      end
    end
  end
end
