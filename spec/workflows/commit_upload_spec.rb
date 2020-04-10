# frozen_string_literal: true

require 'csv'
require 'rails_helper'

RSpec.describe CommitUpload, type: :workflow do
  data_csv_path = 'spec/fixtures/Site_Metadata_BulkUpload_Template.csv'

  it 'Exists' do
    commit_upload = CommitUpload.new

    expect(commit_upload).to be_a CommitUpload
  end

  it 'Can access data given to it' do
    expected = 'FAKE DATA'
    commit_upload = CommitUpload.new(expected)

    expect(commit_upload.data).to eq(expected)
  end

  it 'Can accept csv data' do
    expected = CSV.read(Rails.root.join(data_csv_path))

    commit_upload = CommitUpload.new(expected)

    expect(commit_upload.data).to eq(expected)
  end

  it "Can create a detector from the site meta data upload template if the detector doesn't exist" do
    expected = CSV.read(Rails.root.join(data_csv_path), headers: true)
    create(:organization, name: 'OSU')

    expect { CommitUpload.new(expected).send(:create_detectors) }.to change(Detector, :count)
  end

  it 'Can create a contact from a site meta data upload template' do
    expected = CSV.read(Rails.root.join(data_csv_path), headers: true)
    create(:organization, name: 'OSU')
    create(:state, name: 'Oregon', abbreviation: 'OR')

    expect { CommitUpload.new(expected).send(:create_contacts) }.to change(Contact, :count)
  end

  it 'Can create detector locations and their detection targets and descriptors from a site meta data upload template' do
    csv_data = CSV.read(Rails.root.join(data_csv_path), headers: true)
    create(:local_habitat, label: 'dry conifer')
    create(:sample_unit, code: 107_915)
    create(:detection_target, label: 'rock')
    create(:target_descriptor, label: 'ridge top')

    expect { CommitUpload.new(csv_data).send(:create_detector_locations) }.to change(DetectorLocation, :count)
  end

  it 'Can create deployments from a site meta data upload template' do
    csv_data = CSV.read(Rails.root.join(data_csv_path), headers: true)
    fake_local_habitat = create(:local_habitat, label: 'dry conifer')
    fake_detection_target = create(:detection_target, label: 'rock')
    fake_target_descriptor = create(:target_descriptor, label: 'ridge top', detection_target_id: fake_detection_target.id)
    fake_sample_unit = create(:sample_unit, code: 107_915)

    create(
      :detector_location,
      quad_id: 'NE',
      quad_no: 1,
      local_habitat_id: fake_local_habitat.id,
      detection_target_id: fake_detection_target.id,
      target_descriptor_id: fake_target_descriptor.id,
      sample_unit_id: fake_sample_unit.id
    )

    create(:clutter_type, name: 'Vegetation')
    create(:clutter_percent, id: 1, label: '0%')
    create(:distance_range, label: '20m')
    create(:detector, serial_number: 51_965, model: 'D500X')

    fake_organization = create(:organization, name: 'OSU')
    create(:contact, first_name: 'Trent', last_name: 'Hawkins', organization_id: fake_organization.id)

    expect { CommitUpload.new(csv_data).send(:create_deployments) }.to change(Deployment, :count)
  end
end
