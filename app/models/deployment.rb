class Deployment < ApplicationRecord
  validates :deployment_date,
            :primary_contact_id,
            :created_by, presence: true
  validates_length_of :microphone_height_off_ground, maximum: 255
end
