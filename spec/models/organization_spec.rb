require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject(:organization) { build(:organization)}

  describe 'validations' do
    it {should validate_presence_of(:label)}
    it {should validate_length_of(:label).is_at_most(50)}
  end
end
