class Contact < ApplicationRecord
  validates :last_name, presence: true, allow_blank: false
  validates :first_name, presence: true, allow_blank: false
  validates :notes, presence: true, allow_blank: true

  belongs_to :organization, optional: true
  belongs_to :state
end