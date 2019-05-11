class AddDetectorIssuesToDeployments < ActiveRecord::Migration[5.2]
  def change
    add_column :deployments, :detector_issues, :string
  end
end
