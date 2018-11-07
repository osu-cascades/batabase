class DeploymentSoftware < ApplicationRecord
  validates :deployment_id, :software_id, presence: true
  validates_length_of :version, :classifier_package, maximum: 50
  validates_length_of :other_settings, maximum: 255

end
