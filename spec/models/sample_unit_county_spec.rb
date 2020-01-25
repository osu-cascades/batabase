# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SampleUnitCounty, type: :model do
  let(:sample_unit_county) { FactoryBot.build_stubbed(:sample_unit_county) }

  describe 'Sample Unit County Validation' do
    context 'An sample unit is valid if' do
      it "It has a percentage that's a float" do
        sample_unit_county.percentage = 42.42

        expect(sample_unit_county).to be_valid
      end
    end

    context 'An sample unit county is invalid if' do
      it "It has a percentage that isn't a float" do
        sample_unit_county.percentage = nil

        expect(sample_unit_county).to_not be_valid

        sample_unit_county.percentage = 'INVALID'

        expect(sample_unit_county).to_not be_valid
      end

      it 'It has a percentage of zero' do
        sample_unit_county.percentage = 0

        expect(sample_unit_county).to_not be_valid
      end
    end
  end

  describe 'Sample Unit County Functionality' do
    context 'County Interactions' do
      it 'A sample unit county can return what county it belongs to' do
        expect(sample_unit_county.county.class).to be(County)
      end

      it 'A sample unit county can return the name of the county it belongs to' do
        expect(sample_unit_county.name).to eq('FAKE NAME')
      end
    end

    context 'Sample Unit Interactions' do
      it 'A sample unit county can return what sample unit it belongs to' do
        expect(sample_unit_county.sample_unit.class).to be(SampleUnit)
      end
    end
  end
end
