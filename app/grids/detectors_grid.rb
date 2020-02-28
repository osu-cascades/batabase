class DetectorsGrid
  include Datagrid

  scope do
    Detector
  end

  #
  # Filters
  #
  
  filter(:firmware, :string)
  filter(:manufacturer, :string)
  filter(:model, :string)
  filter(:serial_number, :string)
  filter(:organization_id, :string)

  #
  # Columns
  #

  column(:firmware)
  column(:manufacturer)
  column(:model)
  column(:serial_number)
  column(:organization) { |asset| asset.organization.name }
end
