require 'rails_helper'

RSpec.describe County, type: :model do
  describe 'associations' do
    it { should have_many(:sample_unit_counties) }
    it { should have_many(:sample_units).through(:sample_unit_counties) }
    it { should belong_to(:state) }
  end
end
