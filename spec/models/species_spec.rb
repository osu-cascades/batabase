# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Species, type: :model do
  let(:species) { FactoryBot.build_stubbed(:species) }

  describe 'Species Validation' do
    context 'Species is valid if' do
      it 'It has a species code' do
        species.code = 'FAKE CODE'
        expect(species).to be_valid
      end
    end
  end
end