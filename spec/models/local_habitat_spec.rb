# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocalHabitat, type: :model do
  let(:local_habitat) { FactoryBot.build_stubbed(:local_habitat, :mixed_conifer) }

  describe 'Local Habitat Validation' do
    context 'Local habitat is valid if' do
      it 'It has a label' do
        ['mixed conifer', 'dry conifer', 'hardwood', 'alpine forest', 'mesic forest', 'urban', 'agriculture', 'grassland', 'shrub-steppe'].each do |label|
          local_habitat.label = label
          expect(local_habitat).to be_valid
        end
      end
    end

    context 'Local habitat is invalid if' do
      it 'It contains no label' do
        local_habitat.label = ''

        expect(local_habitat).to_not be_valid
      end

      it "It has a label that isn't pre-specified" do
        local_habitat.label = 'BAD WOOD'

        expect(local_habitat).to_not be_valid
      end
    end
  end
end
