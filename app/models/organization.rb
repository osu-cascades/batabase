class Organization < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  has_many :detectors
end