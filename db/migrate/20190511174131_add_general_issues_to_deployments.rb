class AddGeneralIssuesToDeployments < ActiveRecord::Migration[5.2]
  def change
    add_column :deployments, :general_issues, :string
  end
end
