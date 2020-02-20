# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { FactoryBot.build_stubbed(:organization) }
  let(:organization_with_detectors) { FactoryBot.build_stubbed(:organization, :has_detectors) }
  let(:organization_with_contacts) { FactoryBot.build_stubbed(:organization, :has_contacts) }

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

  describe 'Organization Functionality' do
    context 'Detector Interactions' do
      it 'A organization can fetch all of the detectors associated with it' do
        organization_with_detectors.detectors.each do |detector|
          expect(detector.class).to be(Detector)
        end

        expect(organization_with_detectors.detectors.length).to eq(5)
      end
    end

    context 'Contact Interactions' do
      it 'A organization can fetch all of the contacts associated with it' do
        organization_with_contacts.contacts.each do |contact|
          expect(contact.class).to be(Contact)
        end

        expect(organization_with_contacts.contacts.length).to eq(5)
      end
    end
  end
end
