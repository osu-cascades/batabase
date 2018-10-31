require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    %i(first_name last_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    %i(last_name
      first_name
      organization
      position_title
      address_type
      address
      address_2
      city
      zip_code
      country
      email_address
      work_extension).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(50) }
    end

    it { should validate_length_of(:middle_init).is_at_most(4) }
    it { should validate_length_of(:initials).is_at_most(5) }
    it { should validate_length_of(:state_code).is_at_most(8) }
    it { should validate_length_of(:work_phone).is_at_most(15) }
  end
end
