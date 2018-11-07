class DeploymentContact < ApplicationRecord
  validates :deployment_id, :contact_id, presence: true

end
