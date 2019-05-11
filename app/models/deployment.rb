class Deployment < ApplicationRecord
  validates :deployment_date,
            :contact_id,
            :created_by, presence: true

  validates_length_of :microphone_height_off_ground, maximum: 255

  def contact_name
    Contact.find(contact_id).full_name
  end

  def formated_deployment_date
    deployment_date.strftime('%F')
  end
  
  def formated_recovery_date
    recovery_date.strftime('%F')
  end
end
