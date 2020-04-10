# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClutterPercent, type: :model do
  let(:clutter_percent) { FactoryBot.build_stubbed(:clutter_percent) }

  describe 'Clutter Percent Validation' do
    context 'Clutter Percent is valid if' do
      it 'It has a label' do
        clutter_percent.label = 'FAKE LABEL'

        expect(clutter_percent).to be_valid
      end
    end

    context 'Clutter Percent is invalid if' do
      it 'It contains no label' do
        clutter_percent.label = ''

        expect(clutter_percent).to_not be_valid
      end
    end
  end
end
