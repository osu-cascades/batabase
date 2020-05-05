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

  column(:edit, html: true, header: '') do |detector|
    link_to 'Edit', edit_detector_path(detector), class: "btn btn-primary"
  end

  column(:delete, html: true, header: '') do |detector|
    link_to 'Delete', detector, method: 'delete', class: "btn btn-danger", data: { confirm: 'Are you sure?', disable_with: 'Deleting....' }
  end
end
