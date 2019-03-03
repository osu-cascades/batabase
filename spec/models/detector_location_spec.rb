require 'rails_helper'

RSpec.describe DetectorLocation, type: :model do
  subject(:detector_location) { build(:detector_location) }

  describe 'validations' do
    %i(sample_unit_id location_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_length_of(:location_name).is_at_most(20) }

    %i(ownership description).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(255) }
    end
  end

  describe 'assocations' do
    it { should belong_to(:detection_target).optional }
  end
end
