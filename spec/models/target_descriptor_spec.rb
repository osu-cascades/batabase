require 'rails_helper'

RSpec.describe TargetDescriptor, type: :model do
  subject(:target_descriptor) { build(:target_descriptor) }

  describe 'validations' do
    it { should validate_presence_of(:label) }
  end

  describe 'associations' do
    it { should belong_to(:detection_target) }
  end
end
