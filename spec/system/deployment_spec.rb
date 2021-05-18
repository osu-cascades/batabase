# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deployments Flow', type: :system do
  let(:user) { FactoryBot.create(:user) }

  # TODO: move creates to the top to limit transactions required for the test

  context 'Deployments' do
    before :each do
      sign_in user
      create(:deployment)
    end

    it 'A user can visit the page to view all the deployments' do
      visit home_index_path
      click_button 'Deployments'
      click_on 'View Deployments'

      expect(page).to have_content('FAKE TRIGGER SENSITIVITY')
    end

    it 'A user can visit the page to add new deployments' do
      visit home_index_path
      click_button 'Deployments'
      click_on 'Add Deployment'

      expect(page).to have_content('Create Deployment')
    end

    it 'A user can add a new deployment' do
      Deployment.destroy_all

      visit home_index_path
      click_button 'Deployments'
      click_on 'Add Deployment'

      FactoryBot.attributes_for(:deployment).each_pair do |key, value|
        next if key == :microphone_orientation
        next if key == :pre_trigger
        next if key == :hp_filter
        next if key == :auto_record
        next if key == :trigger_sensitivity
        next if key == :sixteen_thousand_high_filter
        next if key == :primary_contact
        next if key == :recovery_contact
        next if key == :detector_id
        next if key == :distance_range_id
        next if key == :clutter_percent_id
        next if key == :clutter_type_id
        next if key == :detector_location_id

        fill_in key.to_s.capitalize.split('_').join(' '), with: value
      end

      click_button 'Create Deployment'
      expect(page).to have_content('FAKE COMMENTS')
    end

    it 'A user can delete an existing deployment' do
      visit deployments_path

      expect(page).to have_content('FAKE COMMENTS')

      click_on 'Delete'
      expect(page).not_to have_content('FAKE COMMENTS')
    end

    it 'A user can edit/update an existing deployment' do
      visit deployments_path

      expect(page).to have_content('FAKE COMMENTS')

      click_on 'Edit'

      fill_in 'Comments', with: 'DIFFERENT FAKE COMMENTS'

      click_button 'Update Deployment'
      expect(page).to have_content('DIFFERENT FAKE COMMENTS')
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
      expect(page.response_headers['Content-Disposition']).to be('attachment; filename=deployments.xlsx')
    end

    # ## TODO: Write a test for exporting searched deployments ##

    # it 'A user can exported a searched set of Deployment records' do
    #   visit home_index_path
    #   click_button 'Deployments'
    #   click_on 'View Deployments'
    #   fill_in 'Comment Contains', with: 'FAKE COMMENTS'
    #   click_button 'Search'
    #   expect(page).to have_content('FAKE COMMENTS')
    #   click_button 'Deployments'
    #   click_on 'Export Deployments to Excel'

    #   # expect to export searched deployments
      
    # end

    it 'A user can filter deployment results' do
      visit deployments_path
      create(:deployment, comments: "FAKE COMMENTS")
      create(:deployment, comments: "DIFFERENT FAKE COMMENTS")
      get deployments_path, params: { q: { comment_cont: "FAKE COMMENTS" } }
      expect(page).to have_content('FAKE COMMENTS')
      expect(page).not_to have_content('DIFFERENT FAKE COMMENTS')
    end
  end
end
