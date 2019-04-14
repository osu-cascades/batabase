require 'rails_helper'

RSpec.describe BroadHabitatForm, type: :model do
  subject(:broad_habitat_form) { build(:broad_habitat_form) }

  describe 'validations' do
    it { should validate_presence_of(:label) }
  end

  describe 'associations' do
    it { should belong_to(:broad_habitat) }
  end

  describe 'broad_habitat_label' do
    it 'returns broad habitat\'s label' do
      expect(broad_habitat_form.broad_habitat_label).to eq('Example Label')
    end
  end
end
