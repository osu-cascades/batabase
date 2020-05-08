# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpeciesGroup, type: :model do
  let(:species_group) { FactoryBot.build_stubbed(:species_group) }

  describe 'Species Group Validation' do
    context 'A species group is valid if' do
      it 'It has a label' do
        species_group.label = 'FAKE LABEL'

        expect(species_group).to be_valid
      end

      it 'It has a summary' do
        species_group.summary = 'FAKE SUMMARY'

        expect(species_group).to be_valid
      end
    end

    context 'A species group is invalid if' do
      it 'It has no label' do
        species_group.label = ''

        expect(species_group).to_not be_valid
      end

      it 'It has no summary' do
        species_group.summary = ''

        expect(species_group).to_not be_valid
      end
    end
  end

  describe 'Species Group Functionality' do
    context 'Species Interactions' do
      it 'A species group can fetch the species associated with it' do
        pending('TODO: association testing')
        expect(true).to eq(false)
      end
    end
  end
end
