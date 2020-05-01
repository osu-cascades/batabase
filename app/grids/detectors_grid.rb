# frozen_string_literal: true

class DetectorsGrid
  include Datagrid

  scope do
    Detector.includes(:organization)
  end

  #
  # Filters
  #

  filter(:firmware, :string)
  filter(:manufacturer, :string)
  filter(:model, :string)
  filter(:serial_number, :string)
  filter(:organization_name, :string, header: 'Organization') do |value|
    joins(:organization).where(organizations: { name: value })
  end

  #
  # Columns
  #

  column(:firmware)
  column(:manufacturer)
  column(:model)
  column(:serial_number)
  column(:organization, header: 'Organization', &:owner)

  column(:delete, html: true, header: 'Delete') do |detector|
    link_to 'DELETE', detector, method: 'delete', data: { confirm: 'Are you sure?', disable_with: 'Deleting....' }
  end

  column(:update, html: true, header: 'Update') do |detector|
    link_to 'UPDATE', edit_detector_path(detector)
  end
end
