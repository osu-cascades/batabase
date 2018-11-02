require 'rails_helper'

RSpec.describe DetectorLocation, type: :model do
  subject(:detector_location) { build(:detector_location) }

  describe 'validations' do
    %i(site_id location_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end
    it { should validate_length_of(:location_name).is_at_most(20) }
    it { should validate_length_of(:ownership).is_at_most(255) }
  end
end
