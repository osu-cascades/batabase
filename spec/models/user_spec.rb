require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'callback' do
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
