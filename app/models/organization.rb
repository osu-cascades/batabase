# frozen_string_literal: true

class Organization < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  has_many :detectors
  has_many :contacts

  accepts_nested_attributes_for :contacts
end
