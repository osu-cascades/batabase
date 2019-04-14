require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { build(:contact, organization: organization, state: state) }
  let(:organization) { build(:organization) }
  let(:state) { build(:state) }

  describe 'validations' do
    %i(first_name last_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    %i(last_name first_name email).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(50) }
    end
  end

  describe 'associations' do
    %i(state organization).each do |assocation|
      it { should belong_to(assocation).optional }
    end
  end

  describe '#organization_label' do
    it 'returns organization label' do
      expect(contact.organization_label).to eq('Example organization')
    end
  end

  describe '#state_code' do
    it 'returns state code' do
      expect(contact.state_code).to eq('OR')
    end
  end
end
