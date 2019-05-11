class Deployment < ApplicationRecord
  validates :deployment_date,
            :contact_id,
            :created_by, presence: true

  validates_length_of :microphone_height_off_ground, maximum: 255

  belongs_to :sample_unit

  def contact_name
    Contact.find(contact_id).full_name
  end

  def formatted_deployment_date
    deployment_date.strftime('%m/%d/%y')
  end

  def formatted_recovery_date
    recovery_date.strftime('%m/%d/%y')
  end

  def deployment_period
    "#{formatted_deployment_date} - #{formatted_recovery_date}"
  end

  def state_code
    self.try(:sample_unit).try(:primary_state)
  end

  def agency
    self.try(:sample_unit).try(:agency)
  end
end
