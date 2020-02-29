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

  it 'Can create a detector from raw survey 123 data' do
    expected = CSV.read(Rails.root.join('spec/fixtures/populated_bulk_upload_template.csv'), headers: true)
    create(:organization, name: 'OSU')

    CommitUpload.new(expected).send(:create_detectors)
  end
end
