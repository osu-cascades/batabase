require 'rails_helper'

RSpec.describe SpeciesGroup, type: :model do
  subject(:species_group) { SpeciesGroup.new(label: 'Example Label', summary: 'Example Summary') }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:label).is_at_most(50) }
    it { should validate_length_of(:summary).is_at_most(255) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:species) }
  end
end
