require 'rails_helper'

RSpec.describe DetectionTarget, type: :model do
  subject(:detection_target) { build(:detection_target) }

  describe 'validations' do
    it { should validate_presence_of(:label) }
  end
end
