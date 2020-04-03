# frozen_string_literal: true

class UploadDetailsComponent < ApplicationComponent
  def initialize(data:, filename:)
    @data = data
    @filename = filename
  end
end
