require 'rails_helper'

RSpec.describe StudyArea, type: :model do
  subject(:study_area) { build(:study_area) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'assocations' do
    it { should belong_to(:state) }
  end

  describe 'state_code' do
    it 'returns state code' do
      expect(study_area.state_code).to eq("OR")
    end
  end
end
