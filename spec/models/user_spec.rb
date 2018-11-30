require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    %i(first_name last_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end
  end

  describe 'assocations' do
    it { should belong_to(:state) }
    it { should belong_to(:organization) }
  end

  describe 'callbacks' do
    it '#after_initialize should recieve #set_default_user' do
      user = User.allocate
      expect(user).to receive(:set_default_role)
      user.send(:initialize)
    end
  end

  describe '#set_default_role' do
    it 'sets role to guest' do
      expect(user.role).to eql('guest')
    end
  end
end
