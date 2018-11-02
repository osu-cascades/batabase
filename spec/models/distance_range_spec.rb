require 'rails_helper'

RSpec.describe DistanceRange, type: :model do
  subject(:distance_range) { DistanceRange.new(label: 'Example Label') }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:label).is_at_most(50) }
  end
end
