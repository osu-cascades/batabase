# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { FactoryBot.build_stubbed(:contact) }
  let(:contact_with_software) { FactoryBot.build_stubbed(:contact, :has_software) }

  describe 'Contact Validation' do
    context 'Contact is valid if' do
      it 'It has a last name' do
        contact.last_name = 'FAKE LAST NAME'

        expect(contact).to be_valid
      end

      it 'It has a first name' do
        contact.first_name = 'FAKE FIRST NAME'

        expect(contact).to be_valid
      end

      it 'It has notes' do
        contact.notes = 'FAKE NOTES'

        expect(contact).to be_valid
      end

      it 'It has blank notes' do
        contact.notes = ''

        expect(contact).to be_valid
      end

      it 'It has notes under 280 characters' do
        valid_length_notes = 'FAKE' * 50
        contact.notes = valid_length_notes

        expect(contact).to be_valid
      end
    end

    context 'Contact is invalid if' do
      it 'It does not have a last name' do
        contact.last_name = nil

        expect(contact).to_not be_valid
      end

      it 'It has a blank last name' do
        contact.last_name = ''

        expect(contact).to_not be_valid
      end

      it 'It does not have a first name' do
        contact.first_name = nil

        expect(contact).to_not be_valid
      end

      it 'It has a blank first name' do
        contact.first_name = ''

        expect(contact).to_not be_valid
      end

      it 'It has notes above 280 characters' do
        invalid_length_notes = 'FAKE' * 100
        contact.notes = invalid_length_notes

        expect(contact).to_not be_valid
      end
    end
  end

  describe 'Contact Functionality' do
    context 'Organization Interactions' do
      it 'A contact can fetch the organization associated with it' do
        expect(contact.organization.class).to be(Organization)
      end
    end

    context 'State Interactions' do
      it 'A contact can fetch the state associated with it' do
        expect(contact.state.class).to be(State)
      end
    end

    context 'Software Interactions' do
      it 'A contact can fetch all of the software associated with it' do
        contact_with_software.softwares.each do |current_software|
          expect(current_software.class).to be(Software)
        end

        expect(contact_with_software.softwares.length).to eq(5)
      end
    end
  end
end
