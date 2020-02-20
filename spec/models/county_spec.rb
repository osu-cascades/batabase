# frozen_string_literal: true

require 'rails_helper'

RSpec.describe County, type: :model do
  let(:county) { FactoryBot.build_stubbed(:county) }
  let(:county_with_sample_units) { FactoryBot.build_stubbed(:county, :has_sample_units) }

  describe 'County Validation' do
    context 'A county is valid if' do
      it 'It has a name' do
        county.name = 'FAKE NAME'

        expect(county).to be_valid
      end
    end

    context 'A county is invalid if' do
      it 'It has no name' do
        county.name = ''

        expect(county).to_not be_valid
      end
    end
  end

  describe 'County Functionality' do
    context 'State Interactions' do
      it 'A county can fetch the state is belongs to' do
        expect(county.state.class).to be(State)
      end

      it 'A county can fetch the name of the state it is in' do
        expected = 'FAKE NAME'
        actual = county.state.name

        expect(actual).to eq(expected)
      end

      it 'A county can fetch the abbreviation of the state it is in' do
        expected = 'FAKE ABBREVIATION'
        actual = county.state.abbreviation

        expect(actual).to eq(expected)
      end
    end

    context 'Sample Unit County Interactions' do
      it 'A county can fetch the sample unit counties associated with it' do
        county_with_sample_units.sample_unit_counties.each do |sample_unit_county|
          expect(sample_unit_county.class).to be(SampleUnitCounty)
        end

        expect(county_with_sample_units.sample_unit_counties.length).to eq(5)
      end
    end

    context 'Sample Unit Interactions' do
      it 'A county can fetch the sample units associated with it' do
        county_with_sample_units.sample_units.each do |sample_unit|
          expect(sample_unit.class).to be(SampleUnit)
        end

        expect(county_with_sample_units.sample_units.length).to eq(5)
      end
    end
  end
end
