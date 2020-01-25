# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orientation, type: :model do
  let(:orientation) { FactoryBot.build_stubbed(:orientation, :north) }

  describe 'Orientation Validation' do
    context 'Orientation is valid if' do
      it 'It has a named direction' do
        ['N', 'W', 'E', 'S', 'NW', 'NE', 'SW', 'SE'].each do |direction|
          orientation.direction = direction
          expect(orientation).to be_valid
        end
      end
    end

    context 'Orientation is invalid if' do
      it 'It contains no direction' do
        orientation.direction = ''

        expect(orientation).to_not be_valid
      end

      it "It has a direction that isn't a named direction" do
        orientation.direction = 'WN'

        expect(orientation).to_not be_valid

        orientation.direction = 'Q'

        expect(orientation).to_not be_valid
      end
    end
  end
end
