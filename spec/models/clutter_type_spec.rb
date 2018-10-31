require 'rails_helper'

RSpec.describe ClutterType, type: :model do
  subject(:clutter_type) { ClutterType.new(label: 'Example Label') }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:label).is_at_most(50) }
  end
end
