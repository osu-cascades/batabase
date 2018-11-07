require 'rails_helper'

RSpec.describe DeploymentContact, type: :model do
  subject(:deployment_contact) { build(:deployment_contact) }

  describe 'validations' do
    %i(deployment_id contact_id).each do |attribute|
      it { should validate_presence_of(attribute) }
    end
  end
end
