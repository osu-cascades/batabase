class County < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  belongs_to :state
end
