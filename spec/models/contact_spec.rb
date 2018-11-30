require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { build(:contact) }

  describe 'validations' do
    %i(first_name last_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    %i(last_name first_name email).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(50) }
    end
  end

  describe 'assocations' do
    it { should belong_to(:state).optional }
    it { should belong_to(:organization).optional }
  end
end
