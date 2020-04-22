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
  end
end