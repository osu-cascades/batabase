class BroadHabitat < ApplicationRecord
  validates :label, presence: true, allow_blank: false
  has_many :broad_habitat_forms, dependent: :destroy
end
