class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates_length_of :last_name,
                      :first_name,
                      :organization,
                      :position_title,
                      :address_type,
                      :address,
                      :address_2,
                      :city,
                      :zip_code,
                      :country,
                      :email_address,
                      :work_extension,
                      maximum: 50
  validates_length_of :middle_init, maximum: 4
  validates_length_of :initials, maximum: 5
  validates_length_of :state_code, maximum: 8
  validates_length_of :work_phone, maximum: 15

end
