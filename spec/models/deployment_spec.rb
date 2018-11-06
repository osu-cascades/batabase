require 'rails_helper'

RSpec.describe Deployment, type: :model do
  subject(:deployment) { build(:deployment) }

  describe 'validations' do
    %i(deployment_date contact_id created_by).each do |attribute|
      it { should validate_presence_of(attribute) }
    end
    it { should validate_length_of(:microphone_height_off_ground).is_at_most(255) }
  end
end
