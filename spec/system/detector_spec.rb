# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Detector Flows', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'Detectors' do
    before :each do
      sign_in user
      create(:detector)
    end

    it 'A user can view all the detectors' do
      visit home_index_path
      click_button 'Detectors'
      click_on 'View Detectors'

      expect(page).to have_content('FAKE FIRMWARE')
    end

    it 'A user can visit the page to add a detector' do
      visit home_index_path
      click_button 'Detectors'
      click_on 'Add Detector'

      expect(page).to have_content('Create Detector')
    end

    it 'A user can add a new detector' do
      Detector.destroy_all

      visit home_index_path
      click_button 'Detectors'
      click_on 'Add Detector'

      FactoryBot.attributes_for(:detector).each_pair do |key, value|
        fill_in key.to_s.capitalize.split('_').join(' '), with: value
      end

      select 'FAKE NAME', from: 'Organization'

      click_button 'Create Detector'

      expect(page).to have_content('FAKE FIRMWARE')
    end

    it 'A user can delete an existing detector' do
      visit detectors_path

      expect(page).to have_content('FAKE SERIAL NUMBER')

      click_on 'Delete'

      expect(page).not_to have_content('FAKE SERIAL NUMBER')
    end

    it 'A user can edit/update an existing detector' do
      visit detectors_path

      click_on 'Edit'

      fill_in 'Firmware', with: 'DIFFERENT FAKE FIRMWARE'

      click_button 'Update Detector'

      expect(page).not_to have_content('Update Detector')
      expect(page).to have_content('DIFFERENT FAKE FIRMWARE')
    end

    it 'A user can export all Contact records to an excel file' do
      visit home_index_path
      click_button 'Detectors'
      click_on 'Export Detectors to Excel'
      expect(page.response_headers['Content-Disposition']).to be('attachment; filename=detectors.xlsx')
    end

    context 'Queries' do
      it "A user can query for a detector by it's organization" do
        create(:detector, firmware: 'DIFFERENT FAKE FIRMWARE')
        visit detectors_path

        fill_in 'Organization Name contains', with: 'DIFFERENT FAKE FIRMWARE'
        click_button 'Search'

        expect(page).not_to have_content('FAKE FIRMWARE')
      end
    end

    it 'A user can filter Detector results' do
      visit detectors_path
      create(:detector, model: "FAKE MODEL")
      create(:detector, model: "DIFFERENT FAKE MODEL")
      get detectors_path, params: { q: { model_cont: "FAKE MODEL" } }
      expect(page).to have_content('FAKE MODEL')
      expect(page).not_to have_content('DIFFERENT FAKE MODEL')
    end
  end
end
