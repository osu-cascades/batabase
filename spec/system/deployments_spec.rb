# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deployments Flow', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'Deployments' do
    before :each do
      sign_in user
    end

    it 'A user can visit the page to view all the deployments' do
      visit deployments_path
      expect(page).to have_css('table.deployments_grid')
    end

    it 'A user can visit the page to add new deployments' do
      visit deployments_path
      find('a', text: 'Add Deployment').click

      expect(page).to have_content('Create Deployment')
    end

    it 'A user can add a new deployment' do
      fake_organization = create(:organization, name: 'OSU')
      create(:contact, first_name: 'FAKE FIRST', last_name: 'FAKE LAST', organization_id: fake_organization.id)
      create(:detector, serial_number: "12345")
      create(:distance_range, label: "5m")
      create(:clutter_percent, label: "10%")
      create(:clutter_type, name: "FAKE TYPE")
      create(:local_habitat, label: "mixed conifer")
      create(:detection_target, label: "FAKE TARGET")
      create(:target_descriptor, label: "FAKE DESCRIPTOR")
      create(:sample_unit)

      visit deployments_path
      find('a', text: 'Add Deployment').click

      fill_in 'Notes', with: 'FAKE NOTES......'
      fill_in 'Microphone height off ground', with: '9999'
      select 'N', from: 'Microphone orientation'
      fill_in 'Sampling frequency', with: '123'
      select 'OFF', from: 'Pre trigger'
      fill_in 'Recording length', with: 'VERY LONG'
      select 'NO', from: 'Hp filter'
      select 'YES', from: 'Auto record'
      select 'MED', from: 'Trigger sensitivity'
      fill_in 'Input gain', with: 'FAKE INPUT GAIN'
      fill_in 'Trigger level', with: '999999'
      fill_in 'Interval', with: 'FAKE INTERVAL'
      fill_in 'Gain', with: 'FAKE GAIN'
      select 'ON', from: 'Sixteen thousand high filter'
      fill_in 'Sample rate', with: '99999'
      fill_in 'Min duration', with: '9999'
      fill_in 'Max duration', with: 'none'
      fill_in 'Min trigger frequency', with: '99999'
      fill_in 'Trigger window', with: '99999'
      fill_in 'Max length', with: '99999'
      fill_in 'Compression', with: 'A little bit'
      #skipping the datepickers for now
      select 'FAKE LAST, FAKE FIRST', from: 'Primary contact'
      select 'FAKE LAST, FAKE FIRST', from: 'Recovery contact'
      fill_in 'Location id', with: '12345_NE1'
      fill_in 'Latitude', with: 'FAKE LATITUDE'
      fill_in 'Longitude', with: 'FAKE LONGITUDE'
      fill_in 'Site name', with: 'FAKE SITE NAME'
      fill_in 'Directions to site', with: 'FAKE DIRECTIONS'
      select 'OSU', from: 'Land ownership'
      select '12345', from: 'Detector serial number'
      select '5m', from: 'Distance to clutter'
      select '10%', from: 'Clutter category'
      select 'FAKE TYPE', from: 'Clutter type'
      select 'mixed conifer', from: 'Habitat'
      select 'FAKE DESCRIPTOR', from: 'Descriptor'
      fill_in 'Comments', with: 'SOME FAKE COMMENTS'

      click_button 'Create Deployment'
      expect(page).to have_css('table.deployments_grid')
      expect(page).to have_content('SOME FAKE COMMENTS')
    end

  end
end