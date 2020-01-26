# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { FactoryBot.build_stubbed(:organization) }

  describe 'Organization Validation' do
    context 'Organization is valid if' do
      it 'It has a name' do
        organization.name = 'FAKE NAME'

        expect(organization).to be_valid
      end
    end

    context 'Organization is invalid if' do
      it 'It does not have a name' do
        organization.name = nil

        expect(organization).to_not be_valid
      end

      it 'It has a blank name' do
        organization.name = ''

        expect(organization).to_not be_valid
      end
    end
  end
end
