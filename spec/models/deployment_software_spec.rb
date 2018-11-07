require 'rails_helper'

RSpec.describe DeploymentSoftware, type: :model do
  subject(:deployment_software) { build(:deployment_software) }

  describe 'validations' do
    %i(deployment_id software_id).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    %i(version classifier_package).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(50) }
    end

    it { should validate_length_of(:other_settings).is_at_most(255) }
  end
end
