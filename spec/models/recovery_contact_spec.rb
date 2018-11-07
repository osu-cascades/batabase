require 'rails_helper'

RSpec.describe RecoveryContact, type: :model do
  subject(:recovery_contact) { build(:recovery_contact) }

  describe 'validations' do
    %i(deployment_id contact_id).each do |attribute|
      it { should validate_presence_of(attribute) }
    end
  end
end
