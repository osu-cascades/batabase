# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :last_name, presence: true, allow_blank: false
  validates :first_name, presence: true, allow_blank: false
  validates :notes, length: { maximum: 280 }

  has_many :primary_contact, class_name: 'Contact', foreign_key: 'primary_contact_id'
  has_many :recovery_contact, class_name: 'Contact', foreign_key: 'recovery_contact_id'

  belongs_to :organization, optional: true
  belongs_to :state

  has_many :softwares
end
