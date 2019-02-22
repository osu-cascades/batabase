require 'rails_helper'

RSpec.describe BroadHabitat, type: :model do
  subject(:broad_habitat) { BroadHabitat.new(label: 'Example Label') }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:label).is_at_most(50) }
  end

  describe 'associations' do
    it { should have_many(:broad_habitat_forms) }
  end
end
