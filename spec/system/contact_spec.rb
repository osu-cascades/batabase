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

    it 'A user can visit the page to add contacts' do
      visit home_index_path
      click_button 'Contacts'
      click_on 'Add Contact'

      expect(page).to have_content('Create Contact')
    end

    it 'A user can add a new contact' do
      Contact.destroy_all

      visit home_index_path
      click_button 'Contacts'
      click_on 'Add Contact'

      FactoryBot.attributes_for(:contact).each_pair do |key, value|
        fill_in key.to_s.capitalize.split('_').join(' '), with: value
      end

      select 'FAKE NAME', from: 'State'
      select 'FAKE NAME', from: 'Organization'

      click_button 'Create Contact'

      expect(page).to have_content('FAKE FIRST NAME')
    end

    it 'A user can delete an existing contact' do
      visit contacts_path

      expect(page).to have_content('FAKE FIRST NAME')

      click_on 'Delete'

      expect(page).not_to have_content('FAKE FIRST NAME')
    end

    it 'A user can edit/update an existing contact' do
      visit contacts_path

      click_on 'Edit'

      expect(page).to have_content('Update Contact')

      fill_in 'First name', with: 'DIFFERENT FAKE FIRST NAME'

      click_button 'Update Contact'

      expect(page).not_to have_content('Update Contact')
      expect(page).to have_content('DIFFERENT FAKE FIRST NAME')
    end

    it 'A user can export all Contact records to an excel file' do
      visit home_index_path
      click_button 'Contacts'
      click_on 'Export Contacts to Excel'

      expect(page.response_headers['Content-Disposition']).to be('attachment; filename=contacts.xlsx')
    end

    it 'A user can filter deployment results' do
      visit contacts_path
      create(:contact, first_name: "FAKE FIRST NAME")
      create(:contact, first_name: "DIFFERENT FAKE FIRST NAME")
      get contacts_path, params: { q: { first_name_cont: "FAKE FIRST NAME" } }
      expect(page).to have_content('FAKE FIRST NAME')
      expect(page).not_to have_content('DIFFERENT FAKE FIRST NAME')
    end
  end
end
