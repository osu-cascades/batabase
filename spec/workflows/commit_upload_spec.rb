# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommitUpload, type: :workflow do
  it 'exists' do
    commit_upload = CommitUpload.new

    expect(commit_upload).to be_a CommitUpload
  end
end
