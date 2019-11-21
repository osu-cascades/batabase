class BroadHabitat < ApplicationRecord
  validates :habitat_class, presence: true, allow_blank: false
  validates :habitat_form, presence: true, allow_blank: false
end
