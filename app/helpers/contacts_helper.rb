# frozen_string_literal: true

module ContactsHelper
  def action
    if action_name == 'advanced_search'
      :post
    else
      :get
    end
  end

  def contact_column_fields
    [:first_name, :last_name, :notes].freeze
  end

  def contact_column_headers
    [:first_name, :last_name, :notes].freeze
  end

  def contact_organization_headers
    ['Organization'].freeze
  end

  def display_search_results(objects)
    objects.reduce(String.new) do |string, object|
      string << (tag.tr display_search_results_row(object))
    end
  end

  def display_search_results_row(object)
    contact_column_fields.reduce(String.new) do |string, field|
      string << (tag.td object.send(field))
    end.html_safe + display_contact_organization(object.organization) +
      (tag.th link_to 'Edit', edit_contact_path(object), class: 'btn btn-primary') +
      (tag.th link_to 'Delete', object, method: 'delete', class: 'btn btn-danger', data: { confirm: 'Are you sure?', disable_with: 'Deleting....' })
  end

  def display_sort_column_headers(search)
    contact_column_headers.reduce(String.new) do |string, field|
      string << (tag.th sort_link(search, field, {}, method: action))
    end +
      contact_organization_headers.reduce(String.new) do |string, field|
        string << (tag.th field)
      end + (tag.th 'Edit') + (tag.th 'Delete')
  end

  def display_contact_organization(organization)
    tag.td organization.name
  end
end
