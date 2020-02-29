class ContactsGrid
  include Datagrid

  scope do
    Contact.includes(:state, :organiztion)
  end

  filter(:first_name, :string)
  filter(:last_name, :string)
  filter(:state_name, :string, header: "State") do |value|
    self.joins(:state).where(:states => {:name => value})
  end
  filter(:organiztion_name, :string, header: "Organization") do |value|
    self.joins(:organiztion).where(:organiztions => {:name => value})
  end

  column(:first_name)
  column(:last_name)
  column(:state, header: "State") do |contact|
    contact.state.name
  end
  column(:organiztion, header: "Organization") do |contact|
    contact.organiztion.name
  end
end
