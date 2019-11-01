require 'rails_helper'

RSpec.describe DetectorLocation, type: :model do
  subject(:detector_location) { build(:detector_location) }

  describe 'validations' do
    %i(sample_unit location_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_length_of(:location_name).is_at_most(20) }

    %i(land_ownership description).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(255) }
    end
  end

  describe 'associations' do
    %i(detection_target geodetic_system).each do |attribute|
      it { should belong_to(attribute).optional }
    end
  end

  describe 'members' do
    it 'should return sample_unit id' do
      expect(detector_location.sample_unit_id).to_not be_nil
    end
  end
end
