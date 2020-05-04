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

  column(:edit, html: true, header: '') do |contact|
    link_to 'Edit', edit_contact_path(contact), class: "btn btn-primary"
  end

  column(:delete, html: true, header: '') do |contact|
    link_to 'Delete', contact, method: 'delete', class: "btn btn-danger", data: { confirm: 'Are you sure?', disable_with: 'Deleting....' }
  end
end
