require 'rails_helper'

RSpec.describe GeodeticSystem, type: :model do
  subject(:geodetic_system) { GeodeticSystem.new(label: 'Example Label') }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:label).is_at_most(50) }
  end
end
