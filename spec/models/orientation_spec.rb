require 'rails_helper'

RSpec.describe Orientation, type: :model do
  subject(:orientation) { build(:organization)}

  describe 'validations' do
    it {should validate_presence_of(:label)}
    it {should validate_length_of(:label).is_at_most(50)}
  end
end
