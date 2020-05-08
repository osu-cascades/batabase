# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Species, type: :model do
  let(:species) { FactoryBot.build_stubbed(:species) }

  describe 'Species Validation' do
    context 'A species is valid if' do
      it 'It has a code' do
        species.code = 'FAKE CODE'

        expect(species).to be_valid
      end

      it 'It has a scientific name' do
        species.scientific_name = 'FAKE SCIENTIFIC NAME'

        expect(species).to be_valid
      end
    end

    context 'A species is invalid if' do
      it 'It has no code' do
        species.code = ''

        expect(species).to_not be_valid
      end

      it 'It has no scientific name' do
        species.scientific_name = ''

        expect(species).to_not be_valid
      end
    end
  end

  describe 'Species Functionality' do
    context 'Species Group Interactions' do
      it 'A species can fetch the species group it belongs to' do
        pending('TODO: association testing')
        expect(true).to eq(false)
      end
    end
  end
end
