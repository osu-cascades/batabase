class AddRecoveryContactToDeployments < ActiveRecord::Migration[5.2]
  def change
    add_column :deployments, :recovery_contact_id, :integer
  end
end
