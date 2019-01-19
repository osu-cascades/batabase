require 'rails_helper'

RSpec.describe County, type: :model do
  describe 'assocations' do
    it { should belong_to(:state) }
  end
end
