# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contacts Flow', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'Contacts' do
    before :each do
      sign_in user
    end

    it 'A user can view all the contacts' do
      visit contacts_path
      expect(page).to have_css('table.contacts_grid')
    end

    it 'A user can visit a page to add contacts' do
      visit contacts_path
      find('a', text: 'Add Contact').click
      expect(page).to have_content('Create Contact')
    end

    it 'A user can add a new contact' do
      create(:organization, name: 'OSU')
      create(:state, name: 'Oregon', abbreviation: 'OR')

      visit contacts_path

      find('a', text: 'Add Contact').click

      fill_in 'First name', with: 'FAKE FIRST NAME'
      fill_in 'Last name', with: 'FAKE LAST NAME'
      fill_in 'Notes', with: 'SOME FAKE NOTES THAT GO TO GREAT LENGTH.'
      select 'Oregon', from: 'State'
      fill_in 'Organization', with: 'OSU'

      click_button 'Create Contact'
      expect(page).to have_content('FAKE FIRST NAME')
    end
  end
end