# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State, type: :model do
  let(:state) { FactoryBot.build_stubbed(:state) }
  let(:state_with_contacts) { FactoryBot.build_stubbed(:state, :has_contacts) }
  let(:state_with_counties) { FactoryBot.build_stubbed(:state, :has_counties) }
  let(:state_with_sample_units) { FactoryBot.build_stubbed(:state, :has_sample_units) }

  describe 'State Validation' do
    context 'A state is valid if' do
      it 'It has a name' do
        state.name = 'FAKE NAME'

        expect(state).to be_valid
      end

      it 'It has an abbreviation' do
        state.abbreviation = 'FAKE ABBREVIATION'

        expect(state).to be_valid
      end
    end

    context 'A state is invalid if' do
      it 'It has no name' do
        state.name = ''

        expect(state).to_not be_valid
      end

      it 'It has no abbreviation' do
        state.abbreviation = ''

        expect(state).to_not be_valid
      end
    end
  end

  describe 'State Functionality' do
    context 'Contact Interactions' do
      it 'A state can fetch the contacts associated with' do
        state_with_contacts.counties.each do |contact|
          expect(contact.class).to be(Contact)
        end

        expect(state_with_contacts.contacts.length).to eq(5)
      end
    end

    context 'County Interactions' do
      it 'A state can check if it has counties' do
        expect(state.counties?).to be false
        expect(state_with_counties.counties?).to be true
      end

      it 'A state can fetch the counties associated with' do
        state_with_counties.counties.each do |county|
          expect(county.class).to be(County)
        end

        expect(state_with_counties.counties.length).to eq(5)
      end
    end

    context 'Sample Unit State Interactions' do
      it 'A state can fetch the sample unit states associated with' do
        state_with_sample_units.sample_unit_states.each do |sample_unit_state|
          expect(sample_unit_state.class).to be(SampleUnitState)
        end

        expect(state_with_sample_units.sample_unit_states.length).to eq(5)
      end
    end

    context 'Sample Unit Interactions' do
      it 'A state can fetch the sample units associated with' do
        state_with_sample_units.sample_units.each do |sample_unit|
          expect(sample_unit.class).to be(SampleUnit)
        end

        expect(state_with_sample_units.sample_units.length).to eq(5)
      end
    end
  end
end
