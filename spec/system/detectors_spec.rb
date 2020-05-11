# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Detectors Flow', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'Detectors' do
    before :each do
      sign_in user
    end

    it 'A user can view all the detectors' do
      visit home_index_path
      click_button 'Detectors'
      click_on 'View Detectors'

      expect(page).to have_css('table.detectors_grid')
    end

    it 'A user can visit the page to add a detector' do
      visit home_index_path
      click_button 'Detectors'
      click_on 'Add Detector'

      expect(page).to have_content('Create Detector')
    end

    it 'A user can add a new detector' do
      create(:organization, name: 'OSU')

      visit home_index_path
      click_button 'Detectors'
      click_on 'Add Detector'

      fill_in 'Firmware', with: 'FAKE FIRMWARE'
      fill_in 'Manufacturer', with: 'FAKE MANUFACTURER'
      fill_in 'Model', with: 'FAKE MODEL'
      fill_in 'Serial number', with: 'FAKE SERIAL NUMBER'
      select 'OSU', from: 'Organization'

      click_button 'Create Detector'

      expect(page).to have_content('FAKE FIRMWARE')
      expect(page).to have_content('FAKE MANUFACTURER')
      expect(page).to have_content('FAKE MODEL')
      expect(page).to have_content('FAKE SERIAL NUMBER')
      expect(page).to have_content('OSU')
    end

    it 'A user can delete a detector' do
      fake_organization = create(:organization, name: 'Other')

      create(:detector,
             firmware: 'FAKE FIRMWARE',
             manufacturer: 'FAKE MANUFACTURER',
             model: 'FAKE MODEL',
             serial_number: 'FAKE SERIAL NUMBER',
             organization_id: fake_organization.id)

      visit detectors_path
      expect(page).to have_content('FAKE SERIAL NUMBER')

      click_on 'Delete'

      expect(page).not_to have_content('FAKE SERIAL NUMBER')
    end

    it 'A user can edit/update the fields of a detector' do
      fake_organization = create(:organization, name: 'Other')
      create(:organization, name: 'OSU')

      create(:detector,
             firmware: 'FAKE FIRMWARE',
             manufacturer: 'FAKE MANUFACTURER',
             model: 'FAKE MODEL',
             serial_number: 'FAKE SERIAL NUMBER',
             organization_id: fake_organization.id)

      visit detectors_path

      click_on 'Edit'

      fill_in 'Firmware', with: 'DIFFERENT FIRMWARE'
      fill_in 'Manufacturer', with: 'DIFFERENT MANUFACTURER'

      fill_in 'Model', with: 'DIFFERENT MODEL'
      fill_in 'Serial number', with: 'FAKE SERIAL NUMBER'
      select 'OSU', from: 'Owner'

      click_button 'Update Detector'

      expect(page).to have_content('DIFFERENT MANUFACTURER')
      expect(Detector.count).to be(1)
    end

    it 'A user can download all the Detector records into an excel file' do
      fake_organization = create(:organization, name: 'Other')
      create(:organization, name: 'OSU')

      create(:detector,
             firmware: 'FAKE FIRMWARE',
             manufacturer: 'FAKE MANUFACTURER',
             model: 'FAKE MODEL',
             serial_number: 'FAKE SERIAL NUMBER',
             organization_id: fake_organization.id)
      
      visit home_index_path
      click_button 'Detectors'
      click_on 'Export to Excel'
      expect(page.response_headers["Content-Disposition"]).to be("attachment; filename=detectors.xlsx")
    end

    context 'Queries' do
      it 'A user can query for a detector by it\'s organization' do
        first_fake_organization = create(:organization, name: 'OSU')
        second_fake_organization = create(:organization, name: 'Other')

        create(:detector,
               firmware: 'FIRST FAKE FIRMWARE',
               manufacturer: 'FAKE MANUFACTURER',
               model: 'FAKE MODEL',
               serial_number: 'FAKE SERIAL NUMBER',
               organization_id: first_fake_organization.id)

        create(:detector,
               firmware: 'SECOND FAKE FIRMWARE',
               manufacturer: 'FAKE MANUFACTURER',
               model: 'FAKE MODEL',
               serial_number: 'FAKE SERIAL NUMBER',
               organization_id: second_fake_organization.id)

        visit detectors_path

        fill_in 'Organization', with: 'OSU'
        click_button 'Search'

        expect(page).not_to have_content('SECOND FAKE FIRMWARE')
      end
    end
  end
end
