# frozen_string_literal: true

class UploadListComponent < ApplicationComponent
  def initialize(uploads:)
    @uploads = uploads
  end
end
