# frozen_string_literal: true

require 'csv'
require 'rails_helper'

RSpec.describe CommitUpload, type: :workflow do
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
    expected = CSV.read(Rails.root.join('spec/fixtures/raw_oregon_survey123_output.csv'))

    commit_upload = CommitUpload.new(expected)

    expect(commit_upload.data).to eq(expected)
  end

  # it 'Can create a detector from raw survey 123 data if the detector doesn\'t exist' do
  #   expected = CSV.read(Rails.root.join('spec/fixtures/raw_oregon_survey123_output.csv'), headers: true)
  #   create(:organization, name: 'OSU')

  #   expect { CommitUpload.new(expected).send(:create_detectors) }.to change { Detector.count }
  # end

  it 'Can create a contact from raw survey 123 data' do
    expected = CSV.read(Rails.root.join('spec/fixtures/raw_oregon_survey123_output.csv'), headers: true)
    create(:organization, name: 'OSU')
    fake_sample_unit = create(:sample_unit, code: 107915)
    fake_state = create(:state, name: 'Alabama', abbreviation: 'AL')
    create(:sample_unit_state, sample_unit_id: fake_sample_unit.id, state_id: fake_state.id)

    expect { CommitUpload.new(expected).send(:create_contacts) }.to change { Contact.count }
  end
end
