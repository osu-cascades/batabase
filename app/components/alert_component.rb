# frozen_string_literal: true

class AlertComponent < ApplicationComponent
  def initialize(dismissible: false, heading: '', message: '', styling: '', type: :primary)
    @dismissible = dismissible
    @heading = heading
    @message = message
    @styling = styling
    @type = type
  end
end
