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
  filter(:organization_id, :integer)

  #
  # Columns
  #

  column(:firmware)
  column(:manufacturer)
  column(:model)
  column(:serial_number)
  column(:organization_id)
end
