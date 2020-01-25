# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :last_name, presence: true, allow_blank: false
  validates :first_name, presence: true, allow_blank: false
  validates :notes, length: { maximum: 280 }

  belongs_to :organization, optional: true
  belongs_to :state
end
