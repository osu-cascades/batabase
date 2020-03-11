class ContactsGrid
  include Datagrid

  scope do
    Contact.includes(:state, :organization)
  end

  filter(:first_name, :default)
  filter(:last_name, :default)
  filter(:state_name, :string, header: "State") do |value|
    self.joins(:state).where(:states => {:name => value})
  end
  filter(:organiztion_name, :string, header: "Organization") do |value|
    self.joins(:organization).where(:organizations => {:name => value})
  end

  column(:first_name)
  column(:last_name)
  column(:state, header: "State") do |contact|
    contact.state.name
  end
  column(:organization, header: "Organization") do |contact|
    contact.organization.name
  end
end