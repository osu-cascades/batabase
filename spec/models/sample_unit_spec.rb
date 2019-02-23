require 'rails_helper'

RSpec.describe SampleUnit, type: :model do
  subject(:sample_unit) { create(:sample_unit) }

  describe 'validations' do
    it { should validate_presence_of(:site_code) }
    it { should validate_length_of(:site_code).is_at_most(20) }
    it { should validate_length_of(:agency).is_at_most(50) }
  end

  describe 'associations' do
    it { should belong_to(:broad_habitat_form) }
    it { should have_many(:detector_locations) }
  end
end
