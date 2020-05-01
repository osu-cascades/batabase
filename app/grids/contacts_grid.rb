# frozen_string_literal: true

class ContactsGrid
  include Datagrid

  scope do
    Contact.includes(:state, :organization)
  end

  filter(:first_name, :default)
  filter(:last_name, :default)
  filter(:state_name, :string, header: 'State') do |value|
    joins(:state).where(states: { name: value })
  end
  filter(:organiztion_name, :string, header: 'Organization') do |value|
    joins(:organization).where(organizations: { name: value })
  end

  column(:first_name)
  column(:last_name)
  column(:state, header: 'State') do |contact|
    contact.state.name
  end
  column(:organization, header: 'Organization') do |contact|
    contact.organization.name
  end

  column(:delete, html: true, header: 'Delete') do |contact|
    link_to 'DELETE', contact, method: 'delete', data: { confirm: 'Are you sure?', disable_with: 'Deleting....' }
  end

  column(:update, html: true, header: 'Update') do |contact|
    link_to 'UPDATE', edit_contact_path(contact)
  end
end
