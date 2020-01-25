# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SampleUnitState, type: :model do
  let(:sample_unit_state) { FactoryBot.build_stubbed(:sample_unit_state) }

  describe 'Sample Unit State Validation' do
    context 'An sample unit state is valid if' do
      it "It has a percentage that's a float" do
        sample_unit_state.percentage = 42.42

        expect(sample_unit_state).to be_valid
      end
    end

    context 'An sample unit state is invalid if' do
      it "It has a percentage that isn't a float" do
        sample_unit_state.percentage = nil

        expect(sample_unit_state).to_not be_valid

        sample_unit_state.percentage = 'INVALID'

        expect(sample_unit_state).to_not be_valid
      end

      it 'It has a percentage of zero' do
        sample_unit_state.percentage = 0

        expect(sample_unit_state).to_not be_valid
      end
    end
  end

  describe 'Sample Unit State Functionality' do
    context 'State Interactions' do
      it 'A sample unit state can return what state it belongs to' do
        expect(sample_unit_state.state.class).to be(State)
      end

      it 'A sample unit state can return the name of the state it belongs to' do
        expect(sample_unit_state.name).to eq('FAKE NAME')
      end

      it 'A sample unit state can return the abbreviation of the state it belongs to' do
        expect(sample_unit_state.abbreviation).to eq('FAKE ABBREVIATION')
      end
    end

    context 'Sample Unit Interactions' do
      it 'A sample unit state can return what sample unit it belongs to' do
        expect(sample_unit_state.sample_unit.class).to be(SampleUnit)
      end
    end
  end
end
