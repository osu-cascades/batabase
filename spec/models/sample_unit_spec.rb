# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SampleUnit, type: :model do
  let(:sample_unit) { FactoryBot.build_stubbed(:sample_unit) }
  let(:sample_unit_with_sample_unit_states) { FactoryBot.build_stubbed(:sample_unit, :has_sample_unit_states) }
  let(:sample_unit_with_sample_unit_counties) { FactoryBot.build_stubbed(:sample_unit, :has_sample_unit_counties) }
  let(:sample_unit_with_habitat) { FactoryBot.build_stubbed(:sample_unit, :has_broad_habitat_information) }

  describe 'Sample Unit Validation' do
    context 'An sample unit is valid if' do
      it 'It has a grts that is an integer' do
        sample_unit.grts = 42

        expect(sample_unit).to be_valid
      end
    end

    context 'An sample unit is invalid if' do
      it 'It has a grts that is not an integer' do
        sample_unit.grts = 4.2

        expect(sample_unit).to_not be_valid

        sample_unit.grts = 'INVALID'

        expect(sample_unit).to_not be_valid
      end
    end
  end

  describe 'Sample Unit Functionality' do
    context 'State Interactions' do
      it 'A sample unit can fetch which state it primarily consists of' do
        primary_state = sample_unit_with_sample_unit_states.primary_state
        expect(primary_state.percentage).to eq(42.42)
      end

      it 'A sample unit can fetch the name of the state it primarily consists of' do
        expect(sample_unit_with_sample_unit_states.primary_state_name).to eq('FAKE NAME')
      end

      it 'A sample unit can fetch the abbreviation of the state it primarily consists of' do
        expect(sample_unit_with_sample_unit_states.primary_state_abbreviation).to eq('FAKE ABBREVIATION')
      end

      it 'A sample unit can fetch the percentage of the state it primarily consists of' do
        expect(sample_unit_with_sample_unit_states.primary_state_percentage).to eq(42.42)
      end

      it 'A sample unit can fetch all of the sample unit states associated with it' do
        sample_unit_with_sample_unit_states.sample_unit_states.each do |sample_unit_state|
          expect(sample_unit_state.class).to be(SampleUnitState)
        end

        expect(sample_unit_with_sample_unit_states.sample_unit_states.length).to eq(5)
      end

      it 'A sample unit can fetch all of the states associated with it' do
        pending('TODO: figure out how to make these associations on the fly')
        expect(true).to eq(false)

        sample_unit_with_sample_unit_states.states.each do |state|
          expect(state.class).to be(State)
        end

        expect(sample_unit_with_sample_unit_states.states.length).to eq(5)
      end
    end

    context 'County Interactions' do
      it 'A sample unit can fetch which county it primarily consists of' do
        primary_county = sample_unit_with_sample_unit_counties.primary_county
        expect(primary_county.percentage).to eq(42.42)
      end

      it 'A sample unit can fetch the name of the county it primarily consists of' do
        expect(sample_unit_with_sample_unit_counties.primary_county_name).to eq('FAKE NAME')
      end

      it 'A sample unit can fetch the percentage of the county it primarily consists of' do
        expect(sample_unit_with_sample_unit_counties.primary_county_percentage).to eq(42.42)
      end

      it 'A sample unit can fetch all of the sample unit counties associated with it' do
        sample_unit_with_sample_unit_counties.sample_unit_counties.each do |sample_unit_county|
          expect(sample_unit_county.class).to be(SampleUnitCounty)
        end

        expect(sample_unit_with_sample_unit_counties.sample_unit_counties.length).to eq(5)
      end

      it 'A sample unit can fetch all of the counties associated with it' do
        pending('TODO: figure out how to make these associations on the fly')
        expect(true).to eq(false)

        sample_unit_with_sample_unit_counties.counties.each do |county|
          expect(county.class).to be(County)
        end

        expect(sample_unit_with_sample_unit_counties.counties.length).to eq(5)
      end
    end

    context 'Broad Habitat Interactions' do
      it 'A sample unit can fetch associated broad habitat if it exists' do
        expect(sample_unit_with_habitat.broad_habitat.class).to be(BroadHabitat)
      end

      it 'A sample unit fetchs nothing if associated broad it habitat does not exist' do
        expect(sample_unit.broad_habitat).to be_nil
      end

      it "A sample unit can fetch associated broad habitat's name" do
        expect(sample_unit_with_habitat.broad_habitat_name).to eq('FAKE NAME')
      end

      it 'A sample unit can fetch associated broad habitat form if it exists' do
        expect(sample_unit_with_habitat.broad_habitat_form.class).to be(BroadHabitatForm)
      end

      it 'A sample unit fetchs nothing if associated broad habitat form does not exist' do
        expect(sample_unit.broad_habitat_form).to be_nil
      end

      it "A sample unit can fetch associated broad habitat form's name" do
        expect(sample_unit_with_habitat.broad_habitat_form_name).to eq('FAKE NAME')
      end
    end
  end
end
