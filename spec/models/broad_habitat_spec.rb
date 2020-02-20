# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BroadHabitat, type: :model do
  let(:broad_habitat) { FactoryBot.build_stubbed(:broad_habitat) }
  let(:broad_habitat_with_broad_habitat_forms) { FactoryBot.build_stubbed(:broad_habitat, :has_broad_habitat_forms) }
  let(:broad_habitat_with_sample_units) { FactoryBot.build_stubbed(:broad_habitat, :has_sample_units) }

  describe 'Broad Habitat Validation' do
    context 'An broad habitat is valid if' do
      it 'It has a habitat name' do
        broad_habitat.name = 'FAKE NAME'

        expect(broad_habitat).to be_valid
      end
    end

    context 'An broad habitat is invalid if' do
      it 'It has no habitat name' do
        broad_habitat.name = ''

        expect(broad_habitat).to_not be_valid
      end
    end
  end

  describe 'Broad Habitat Functionality' do
    context 'Broad Habitat Form Interactions' do
      it 'A broad habitat can fetch the broad habitat forms associated with it' do
        broad_habitat_with_broad_habitat_forms.broad_habitat_forms.each do |broad_habitat_form|
          expect(broad_habitat_form.class).to be(BroadHabitatForm)
        end

        expect(broad_habitat_with_broad_habitat_forms.broad_habitat_forms.length).to eq(5)
      end
    end

    context 'Sample Unit Interactions' do
      it 'A broad habitat can fetch the sample units associated with' do
        broad_habitat_with_sample_units.sample_units.each do |sample_unit|
          expect(sample_unit.class).to be(SampleUnit)
        end

        expect(broad_habitat_with_sample_units.sample_units.length).to eq(5)
      end
    end
  end
end
