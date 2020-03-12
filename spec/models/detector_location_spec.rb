# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DetectorLocation, type: :model do
  let(:detector_location) { FactoryBot.build_stubbed(:detector_location) }

  describe 'Detector Location Validation' do
    context 'Detector location is valid if' do
      it 'It has a quad id' do
        ['NW', 'NE', 'SW', 'SE'].each do |quad_id|
          detector_location.quad_id = quad_id

          expect(detector_location).to be_valid
        end
      end
    end

    context 'Detector location is invalid if' do
      it 'It contains no quad id' do
        detector_location.quad_id = ''

        expect(detector_location).to_not be_valid
      end

      it "It has a quad id that isn't pre-specified" do
        detector_location.quad_id = 'INVALID QUAD ID'

        expect(detector_location).to_not be_valid
      end
    end
  end

  describe 'Detector Location Functionality' do
    context 'Detection Target Interactions' do
      it 'A detector location can fetch the detection target associated with it' do
        expect(detector_location.detection_target.class).to be(DetectionTarget)
      end
    end

    context 'Local Habitat Interactions' do
      it 'A detector location can fetch the local habitat associated with it' do
        expect(detector_location.local_habitat.class).to be(LocalHabitat)
      end
    end

    context 'Sample Unit Interactions' do
      it 'A detector location can fetch the sample unit associated with it' do
        expect(detector_location.sample_unit.class).to be(SampleUnit)
      end
    end

    context 'After Create Callback' do
      it 'Sets location identifier using existing model details' do
        # TODO: Make this better
        broad_habitat = create(:broad_habitat)
        broad_habitat_form = create(:broad_habitat_form, broad_habitat_id: broad_habitat.id)
        local_habitat = create(:local_habitat, :hardwood)
        sample_unit = create(:sample_unit, broad_habitat_id: broad_habitat.id, broad_habitat_form_id: broad_habitat_form.id)
    
        valid_detector_location = create(
          :detector_location,
          sample_unit_id: sample_unit.id,
          local_habitat_id: local_habitat.id
        )

        expected_location_identifier =
          valid_detector_location.sample_unit_id.to_s + '_' +
          valid_detector_location.quad_id.to_s +
          valid_detector_location.quad_no.to_s

        expect(valid_detector_location.location_identifier).to eq(expected_location_identifier)
      end
    end
  end
end
