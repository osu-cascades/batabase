require 'rails_helper'

RSpec.describe Detector, type: :model do
  subject(:detector) { build(:detector, organization: organization) }
  let(:organization) { build(:organization) }

  describe 'validations' do
    %i(serial_num manufacturer).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    %i(serial_num model manufacturer firmware).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(50) }
    end
  end

  describe 'associations' do
    it { should belong_to(:organization).optional }
  end

  describe '#owning_agency' do
    it 'returns owning agency' do
      expect(detector.owning_agency).to eq('Example organization')
    end
  end
end
