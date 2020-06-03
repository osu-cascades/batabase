# frozen_string_literal: true

class FormComponent < ApplicationComponent
  def initialize(model, fields, header_text)
    @model = model
    @fields = fields
    @header_text = header_text
  end
end
