# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Detectors Flow', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'Detectors' do
    before :each do
      sign_in user
    end

    it 'A user can view all the detectors' do
      visit detectors_path
      expect(page).to have_css('table.detectors_grid')
    end

    it 'A user can add a new detector' do
      create(:organization, name: "OSU")

      visit detectors_path
      find('a', text: 'Add Detector').click
            
      fill_in 'Firmware', with: 'FAKE FIRMWARE'
      fill_in 'Manufacturer', with: 'FAKE MANUFACTURER'
      fill_in 'Model', with: 'FAKE MODEL'
      fill_in 'Serial number', with: 'FAKE SERIAL NUMBER'
      fill_in 'Organization', with: 'OSU'

      click_button 'Create Detector'

      expect(page).to have_content('FAKE FIRMWARE')
      expect(page).to have_content('FAKE MANUFACTURER')
      expect(page).to have_content('FAKE MODEL')
      expect(page).to have_content('FAKE SERIAL NUMBER')
      expect(page).to have_content('OSU')
    end

    it 'A newly created detector will use \'Other\' as it\'s organization if it can\'t find it' do
      create(:organization, name: "Other")
      visit detectors_path

      find('a', text: 'Add Detector').click
            
      fill_in 'Firmware', with: 'FAKE FIRMWARE'
      fill_in 'Manufacturer', with: 'FAKE MANUFACTURER'
      fill_in 'Model', with: 'FAKE MODEL'
      fill_in 'Serial number', with: 'FAKE SERIAL NUMBER'
      fill_in 'Organization', with: 'FAKE ORGANIZATION THAT DOES NOT EXIST'

      click_button 'Create Detector'

      expect(page).to have_content('Other')
    end

    it 'A user can delete a detector' do
        fake_organization = create(:organization, name: 'Other')

        create(:detector, 
          firmware: 'FAKE FIRMWARE', 
          manufacturer: 'FAKE MANUFACTURER', 
          model: 'FAKE MODEL', 
          serial_number: 'FAKE SERIAL NUMBER',
          organization_id: fake_organization.id
        )

        visit detectors_path
        expect(page).to have_content('FAKE SERIAL NUMBER')

        find('a', text: 'DELETE').click

        expect(page).not_to have_content('FAKE SERIAL NUMBER')
    end

    it 'A user can update the fields of a detector' do
      fake_organization = create(:organization, name: 'Other')
      second_fake_organization = create(:organization, name: 'OSU')

      create(:detector, 
        firmware: 'FAKE FIRMWARE', 
        manufacturer: 'FAKE MANUFACTURER', 
        model: 'FAKE MODEL', 
        serial_number: 'FAKE SERIAL NUMBER',
        organization_id: fake_organization.id
      )

      visit detectors_path

      find('a', text: 'UPDATE').click

      fill_in 'Firmware', with: 'DIFFERENT FIRMWARE'
      fill_in 'Manufacturer', with: 'DIFFERENT MANUFACTURER'
        
      fill_in 'Model', with: 'DIFFERENT MODEL'
      fill_in 'Serial number', with: 'FAKE SERIAL NUMBER'
      fill_in 'Owner', with: 'OSU'

      click_button 'Update Detector'

      expect(page).to have_content('DIFFERENT MANUFACTURER')
      expect(Detector.count).to be(1)
    end
  end    
end
