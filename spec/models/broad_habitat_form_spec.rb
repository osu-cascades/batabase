# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BroadHabitatForm, type: :model do
  let(:broad_habitat_form) { FactoryBot.build_stubbed(:broad_habitat_form) }
  let(:broad_habitat_form_with_sample_units) { FactoryBot.build_stubbed(:broad_habitat_form, :has_sample_units) }

  describe 'Broad Habitat Validation' do
    context 'An broad habitat is valid if' do
      it 'It has a habitat name' do
        broad_habitat_form.name = 'FAKE NAME'

        expect(broad_habitat_form).to be_valid
      end
    end

    context 'An broad habitat is invalid if' do
      it 'It has no habitat name' do
        broad_habitat_form.name = ''

        expect(broad_habitat_form).to_not be_valid
      end
    end
  end

  describe 'Broad Habitat Form Functionality' do
    context 'Broad Habitat Interactions' do
      it 'A broad habitat form can fetch what broad habitat it belongs to' do
        expect(broad_habitat_form.broad_habitat.class).to be(BroadHabitat)
      end
    end

    context 'Sample Unit Interactions' do
      it 'A broad habitat form can fetch the sample units associated with it' do
        broad_habitat_form_with_sample_units.sample_units.each do |sample_unit|
          expect(sample_unit.class).to be(SampleUnit)
        end

        expect(broad_habitat_form_with_sample_units.sample_units.length).to eq(5)
      end
    end
  end
end
