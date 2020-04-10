# frozen_string_literal: true

class GlobalHeaderComponent < ApplicationComponent
  def initialize(signed_in: false)
    @signed_in = signed_in
  end
end
