# frozen_string_literal: true

class SonobatOutput < ApplicationRecord
  belongs_to :deployment
  accepts_nested_attributes_for :deployment
  
end
