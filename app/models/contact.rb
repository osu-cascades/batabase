class Contact < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates_length_of :last_name,
                      :first_name,
                      :email, maximum: 50

  belongs_to :state, optional: true
  belongs_to :organization, optional: true

  def name
    "#{first_name} #{last_name}"
  end
end
