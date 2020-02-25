# frozen_string_literal: true

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
end
