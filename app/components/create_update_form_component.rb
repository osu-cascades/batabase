# frozen_string_literal: true

class CreateUpdateFormComponent < ApplicationComponent
  def initialize(model, fields, header_text)
    @model = model
    @fields = fields
    @header_text = header_text
  end
end
