# frozen_string_literal: true

class CommitUpload
  attr_accessor :data

  def initialize(data = nil)
    @data = data
  end
end
