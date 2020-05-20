# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contacts Flow', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'Contacts' do
    before :each do
      sign_in user
      create(:contact)
    end

    it 'A user can view all the contacts' do
      visit home_index_path
      click_button 'Contacts'
      click_on 'View Contacts'

      expect(page).to have_content('FAKE FIRST NAME')
    end

    it 'A user can visit a page to add contacts' do
      visit home_index_path
      click_button 'Contacts'
      click_on 'Add Contact'

      expect(page).to have_content('Create Contact')
    end

    it 'A user can add a new contact' do
      visit home_index_path
      click_button 'Contacts'
      click_on 'Add Contact'

      fill_in 'First name', with: 'FAKE FIRST NAME'
      fill_in 'Last name', with: 'FAKE LAST NAME'
      fill_in 'Notes', with: 'SOME FAKE NOTES THAT GO TO GREAT LENGTH.'
      select 'FAKE NAME', from: 'State'
      select 'FAKE NAME', from: 'Organization'

      click_button 'Create Contact'
      expect(page).to have_content('SOME FAKE NOTES THAT GO TO GREAT LENGTH.')
    end

    it 'A user can delete an existing contact' do
      visit contacts_path

      expect(page).to have_content('FAKE FIRST')

      click_on 'Delete'

      expect(page).not_to have_content('FAKE FIRST')
    end

    it 'A user can edit/update an existing contact' do
      visit contacts_path

      click_on 'Edit'

      expect(page).to have_content('Update Contact')

      fill_in 'First name', with: 'DIFFERENT FIRST NAME'

      click_button 'Update Contact'

      expect(page).not_to have_content('Update Contact')
      expect(page).to have_content('DIFFERENT FIRST NAME')
    end

    it 'A user can export all of the Contact records to an excel file' do
      visit home_index_path
      click_button 'Contacts'
      click_on 'Export Contacts to Excel'

      expect(page.response_headers['Content-Disposition']).to be('attachment; filename=contacts.xlsx')
    end
  end
end
