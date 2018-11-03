class Contact < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates_length_of :state_code, maximum: 8
  validates_length_of :last_name,
                      :first_name,
                      :organization,
                      :email, maximum: 50
end
