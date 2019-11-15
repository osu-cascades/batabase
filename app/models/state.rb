class State < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :abbreviation, presence: true, allow_blank: false
end
