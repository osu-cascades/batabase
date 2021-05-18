# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sonobat Output Flows', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before :each do
    sign_in user
    create(:sonobat_output)
  end

  context 'Index' do
    it 'A user can view all sonobat outputs' do
      visit home_index_path
      click_button 'Sonobat Outputs'
      click_on 'View Sonobat Outputs'

      expect(page).to have_content('FAKE CALLS PER SEC')
    end
  end

  context 'New' do
    it 'A user can visit a page to add sonobat output' do
      visit home_index_path
      click_button 'Sonobat Outputs'
      click_on 'Add Sonobat Output'

      expect(page).to have_content('Create Sonobat Output')
    end

    it 'A user can add a new sonobat output' do
      SonobatOutput.destroy_all

      fake_deployment = create(:deployment)

      visit home_index_path
      click_button 'Sonobat Outputs'
      click_on 'Add Sonobat Output'

      select fake_deployment.id, from: 'Deployment'

      FactoryBot.attributes_for(:sonobat_output).each_pair do |key, value|
        next if key == :night
        next if key == :hi_f
        next if key == :lo_f

        fill_in key.to_s.capitalize.split('_').join(' '), with: value
      end

      click_button 'Create Sonobat Output'
      expect(page).to have_content('FAKE SPP ACCP')
    end

    it 'A user can delete an existing sonobat output' do
      visit sonobat_outputs_path

      expect(page).to have_content('FAKE SPP ACCP')

      click_on 'Delete'

      expect(page).not_to have_content('FAKE SPP ACCP')
    end

    it 'A user can edit/update an existing sonobat output' do
      visit sonobat_outputs_path

      click_on 'Edit'

      expect(page).to have_content('Update Sonobat Output')

      fill_in 'Spp accp', with: 'DIFFERENT FAKE SPP ACCP'

      click_button 'Update Sonobat Output'

      expect(page).not_to have_content('Update Sonobat Output')
      expect(page).to have_content('DIFFERENT FAKE SPP ACCP')
    end

    it 'A user can export all Sonobat Output records to an excel file' do
      visit home_index_path
      click_button 'Sonobat Outputs'
      click_on 'Export Sonobat Outputs to Excel'

      expect(page.response_headers['Content-Disposition']).to be('attachment; filename=sonobat_outputs.xlsx')
    end

    it 'A user can filter Sonobat Output results' do
      visit sonobat_outputs_path
      create(:sonobat_output, notes: "FAKE NOTES")
      create(:sonobat_output, notes: "DIFFERENT FAKE NOTES")
      get sonobat_outputs_path, params: { q: { comment_cont: "FAKE NOTES" } }
      expect(page).to have_content('FAKE NOTES')
      expect(page).not_to have_content('DIFFERENT FAKE NOTES')
    end
  end
end
