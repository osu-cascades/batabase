namespace :initialize do
  desc "Populate contact's state_id with correct state.id"
  task 'contact_state_id' => :environment do
    Contact.all.each do |contact|
      contact_state_code = contact.state_code
      next if contact_state_code.nil?

      state = State.where(state_code: contact.state_code).first
      next if state.nil?

      next if contact.state_id != nil
      contact.state_id = state.try(:id)
      contact.save!
    end
    puts "Populated contact state_id"
  end

  desc "Populate contact's organization_id with correct organization.id"
  task 'contact_organization_id' => :environment do
    Contact.all.each do |contact|
      contact_organization = contact.attributes['organization']
      next if contact_organization.nil?

      organization = Organization.where(label: contact_organization).first
      next if organization.nil?

      next if contact.organization_id != nil
      contact.organization_id = organization.try(:id)
      contact.save!
    end
    puts "Populated contact organization_id"
  end

  desc "Dropped contact's organization & state_code columns"
  task 'contact_drop_columns' => :environment do
    ActiveRecord::Migration.remove_column :contacts, :organization
    ActiveRecord::Migration.remove_column :contacts, :state_code
    puts "Dropped contact's organization & state_code columns"
  end
end
