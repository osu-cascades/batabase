# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deployments Flow', type: :system do
  let(:user) { FactoryBot.create(:user) }

  # TODO: move creates to the top to limit transactions required for the test

  context 'Deployments' do
    before :each do
      sign_in user
    end

    it 'A user can visit the page to view all the deployments' do
      visit home_index_path
      click_button 'Deployments'
      click_on 'View Deployments'

      expect(page).to have_css('table.deployments_grid')
    end

    it 'A user can visit the page to add new deployments' do
      visit home_index_path
      click_button 'Deployments'
      click_on 'Add Deployment'

      expect(page).to have_content('Create Deployment')
    end

    it 'A user can add a new deployment' do
      fake_organization = create(:organization, name: 'OSU')
      create(:contact, first_name: 'FAKE FIRST', last_name: 'FAKE LAST', organization_id: fake_organization.id)
      create(:detector, serial_number: '12345')
      create(:distance_range, label: '5m')
      create(:clutter_percent, label: '10%')
      create(:clutter_type, name: 'FAKE TYPE')
      fake_local_habitat = create(:local_habitat, label: 'mixed conifer')
      fake_detection_target = create(:detection_target, label: 'FAKE TARGET')
      fake_target_descriptor = create(:target_descriptor, label: 'FAKE DESCRIPTOR')
      fake_sample_unit = create(:sample_unit, code: '12345')
      create(
        :detector_location,
        quad_id: 'NE',
        quad_no: 1,
        detection_target_id: fake_detection_target.id,
        target_descriptor_id: fake_target_descriptor.id,
        local_habitat_id: fake_local_habitat.id,
        sample_unit_id: fake_sample_unit.id
      )

      visit home_index_path
      click_button 'Deployments'
      click_on 'Add Deployment'

      fill_in 'Notes', with: 'FAKE NOTES......'
      fill_in 'Microphone height off ground', with: 3.5
      select 'N', from: 'Microphone orientation'
      fill_in 'Sampling frequency', with: '123'
      select 'OFF', from: 'Pre trigger'
      fill_in 'Recording length', with: 'VERY LONG'
      select 'NO', from: 'Hp filter'
      select 'YES', from: 'Auto record'
      select 'MED', from: 'Trigger sensitivity'
      fill_in 'Input gain', with: 'FAKE INPUT GAIN'
      fill_in 'Trigger level', with: 'FAKE LEVEL'
      fill_in 'Interval', with: 'FAKE INTERVAL'
      fill_in 'Gain', with: 'FAKE GAIN'
      select 'ON', from: 'Sixteen thousand high filter'
      fill_in 'Sample rate', with: 9000
      fill_in 'Min duration', with: 'FAKE MIN'
      fill_in 'Max duration', with: 'FAKE MAX'
      fill_in 'Min trigger frequency', with: 1
      fill_in 'Trigger window', with: 5
      fill_in 'Max length', with: '00:99'
      fill_in 'Compression', with: 'A little bit'
      fill_in 'Deployment date', with: '01/01/01, 12:00AM'
      fill_in 'Recovery date', with: '01/01/01, 12:00AM'
      fill_in 'Recording start', with: '01/01/01, 12:00AM'
      fill_in 'Recording stop', with: '01/01/01, 12:00AM'
      select 'FAKE LAST, FAKE FIRST', from: 'Primary contact'
      select 'FAKE LAST, FAKE FIRST', from: 'Recovery contact'
      fill_in 'Location id', with: '12345_NE1'
      fill_in 'Latitude', with: 42.00
      fill_in 'Longitude', with: -119.00
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

    it "A user can create a deployment even if the detector location doesn't exist yet" do
      fake_organization = create(:organization, name: 'OSU')
      create(:contact, first_name: 'FAKE FIRST', last_name: 'FAKE LAST', organization_id: fake_organization.id)
      create(:detector, serial_number: '12345')
      create(:distance_range, label: '5m')
      create(:clutter_percent, label: '10%')
      create(:clutter_type, name: 'FAKE TYPE')
      create(:local_habitat, label: 'mixed conifer')
      create(:detection_target, label: 'FAKE TARGET')
      create(:target_descriptor, label: 'FAKE DESCRIPTOR')
      create(:sample_unit, code: '12345')

      visit home_index_path
      click_button 'Deployments'
      click_on 'Add Deployment'

      fill_in 'Notes', with: 'FAKE NOTES......'
      fill_in 'Microphone height off ground', with: 3.5
      select 'N', from: 'Microphone orientation'
      fill_in 'Sampling frequency', with: '123'
      select 'OFF', from: 'Pre trigger'
      fill_in 'Recording length', with: 'VERY LONG'
      select 'NO', from: 'Hp filter'
      select 'YES', from: 'Auto record'
      select 'MED', from: 'Trigger sensitivity'
      fill_in 'Input gain', with: 'FAKE INPUT GAIN'
      fill_in 'Trigger level', with: 'FAKE LEVEL'
      fill_in 'Interval', with: 'FAKE INTERVAL'
      fill_in 'Gain', with: 'FAKE GAIN'
      select 'ON', from: 'Sixteen thousand high filter'
      fill_in 'Sample rate', with: 9000
      fill_in 'Min duration', with: 'FAKE MIN'
      fill_in 'Max duration', with: 'FAKE MAX'
      fill_in 'Min trigger frequency', with: 1
      fill_in 'Trigger window', with: 5
      fill_in 'Max length', with: '00:99'
      fill_in 'Compression', with: 'A little bit'
      fill_in 'Deployment date', with: '01/01/01, 12:00AM'
      fill_in 'Recovery date', with: '01/01/01, 12:00AM'
      fill_in 'Recording start', with: '01/01/01, 12:00AM'
      fill_in 'Recording stop', with: '01/01/01, 12:00AM'
      select 'FAKE LAST, FAKE FIRST', from: 'Primary contact'
      select 'FAKE LAST, FAKE FIRST', from: 'Recovery contact'
      fill_in 'Location id', with: '12345_NE1'
      fill_in 'Latitude', with: 42.00
      fill_in 'Longitude', with: -119.00
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

    it 'A user can delete an existing deployment' do
      fake_organization = create(:organization, name: 'OSU')
      fake_contact = create(:contact, first_name: 'FAKE FIRST', last_name: 'FAKE LAST', organization_id: fake_organization.id)
      fake_detector = create(:detector, serial_number: '12345')
      create(:distance_range, label: '5m')
      create(:clutter_percent, label: '10%')
      fake_clutter_type = create(:clutter_type, name: 'FAKE TYPE')
      fake_local_habitat = create(:local_habitat, label: 'mixed conifer')
      fake_detection_target = create(:detection_target, label: 'FAKE TARGET')
      fake_target_descriptor = create(:target_descriptor, label: 'FAKE DESCRIPTOR')
      fake_sample_unit = create(:sample_unit, code: '12345')
      fake_detector_location = create(
        :detector_location,
        quad_id: 'NE',
        quad_no: 1,
        detection_target_id: fake_detection_target.id,
        target_descriptor_id: fake_target_descriptor.id,
        local_habitat_id: fake_local_habitat.id,
        sample_unit_id: fake_sample_unit.id
      )

      create(
        :deployment,
        detector_location_id: fake_detector_location.id,
        clutter_type_id: fake_clutter_type.id,
        detector_id: fake_detector.id,
        primary_contact_id: fake_contact.id,
        recovery_contact_id: fake_contact.id,
        comments: 'FAKE COMMENTS'
      )

      visit deployments_path

      expect(page).to have_content('FAKE COMMENTS')

      click_on 'Delete'
      expect(page).not_to have_content('FAKE COMMENTS')
    end

    it 'A user can edit/update an existing deployment' do
      fake_organization = create(:organization, name: 'OSU')
      fake_contact = create(:contact, first_name: 'FAKE FIRST', last_name: 'FAKE LAST', organization_id: fake_organization.id)
      fake_detector = create(:detector, serial_number: '12345')
      fake_distance = create(:distance_range, label: '5m')
      create(:clutter_percent, label: '10%')
      fake_clutter_type = create(:clutter_type, name: 'FAKE TYPE')
      fake_local_habitat = create(:local_habitat, label: 'mixed conifer')
      fake_detection_target = create(:detection_target, label: 'FAKE TARGET')
      fake_target_descriptor = create(:target_descriptor, label: 'FAKE DESCRIPTOR')
      fake_sample_unit = create(:sample_unit, code: '12345')
      fake_detector_location = create(
        :detector_location,
        quad_id: 'NE',
        quad_no: 1,
        detection_target_id: fake_detection_target.id,
        target_descriptor_id: fake_target_descriptor.id,
        local_habitat_id: fake_local_habitat.id,
        sample_unit_id: fake_sample_unit.id
      )

      create(
        :deployment,
        detector_location_id: fake_detector_location.id,
        distance_range_id: fake_distance.id,
        clutter_type_id: fake_clutter_type.id,
        detector_id: fake_detector.id,
        primary_contact_id: fake_contact.id,
        recovery_contact_id: fake_contact.id,
        comments: 'FAKE COMMENTS'
      )

      visit deployments_path

      expect(page).to have_content('FAKE COMMENTS')

      click_on 'Edit'

      fill_in 'Comments', with: 'CHANGING THE FAKE COMMENTS'

      click_button 'Update Deployment'
      expect(page).to have_content('CHANGING THE FAKE COMMENTS')
    end

    it 'A user can export all of the Deployment records to an excel file' do
      fake_organization = create(:organization, name: 'OSU')
      fake_contact = create(:contact, first_name: 'FAKE FIRST', last_name: 'FAKE LAST', organization_id: fake_organization.id)
      fake_detector = create(:detector, serial_number: '12345')
      fake_distance = create(:distance_range, label: '5m')
      create(:clutter_percent, label: '10%')
      fake_clutter_type = create(:clutter_type, name: 'FAKE TYPE')
      fake_local_habitat = create(:local_habitat, label: 'mixed conifer')
      fake_detection_target = create(:detection_target, label: 'FAKE TARGET')
      fake_target_descriptor = create(:target_descriptor, label: 'FAKE DESCRIPTOR')
      fake_sample_unit = create(:sample_unit, code: '12345')
      fake_detector_location = create(
        :detector_location,
        quad_id: 'NE',
        quad_no: 1,
        detection_target_id: fake_detection_target.id,
        target_descriptor_id: fake_target_descriptor.id,
        local_habitat_id: fake_local_habitat.id,
        sample_unit_id: fake_sample_unit.id
      )

      create(
        :deployment,
        detector_location_id: fake_detector_location.id,
        distance_range_id: fake_distance.id,
        clutter_type_id: fake_clutter_type.id,
        detector_id: fake_detector.id,
        primary_contact_id: fake_contact.id,
        recovery_contact_id: fake_contact.id,
        comments: 'FAKE COMMENTS'
      )

      visit home_index_path
      click_button 'Deployments'
      click_on 'Export Deployments to Excel'
      expect(page.response_headers["Content-Disposition"]).to be("attachment; filename=deployments.xlsx")
    end
  end
end
