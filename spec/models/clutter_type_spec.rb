# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClutterType, type: :model do
  let(:clutter_type) { FactoryBot.build_stubbed(:clutter_type) }

  describe 'Clutter Type Validation' do
    context 'Clutter Type is valid if' do
      it 'It has a name' do
        clutter_type.name = 'FAKE NAME'

        expect(clutter_type).to be_valid
      end
    end

    context 'Clutter Type is invalid if' do
      it 'It contains no name' do
        clutter_type.name = ''

        expect(clutter_type).to_not be_valid
      end
    end
  end
end
