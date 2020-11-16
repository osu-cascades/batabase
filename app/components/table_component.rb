# frozen_string_literal: true

require 'ransack'

class TableComponent < ApplicationComponent
  attr_reader :fields, :headers, :helpers, :object, :search

  def initialize(fields, headers, helpers, object, search)
    @fields = fields
    @headers = headers
    @helpers = helpers
    @object = object
    @search = search
  end

  def action
    if action_name == 'advanced_search'
      :post
    else
      :get
    end
  end

  def display_search_results(objects)
    objects.reduce(String.new) do |string, object|
      string << (tag.tr display_search_results_row(object))
    end
  end

  def display_search_results_row(object)
    output = ''
    fields.each do |field|
      output += (tag.td extract_values(field, object))
    end
    output.html_safe + rest_actions(object)
  end

  def display_sort_column_headers(search)
    headers.reduce(String.new) do |string, field|
      string << (tag.th link(field, search))
    end + (tag.th 'Edit') + (tag.th 'Delete')
  end

  def extract_values(fields, object)
    return object if object.nil?
    return object.public_send(fields) if fields.class != Array
    # return object.public_send(fields.first) if fields.one?
    return handle_public_send(object, fields) if fields.one?

    # extract_values(fields[1..-1], object.public_send(fields.first))
    extract_values(fields[1..-1], handle_public_send(object, fields))

  end

  def handle_public_send(object, fields)
    if fields.first.class == Array
      object.public_send(*fields.first)
    else
      object.public_send(fields.first)
    end
  end

  def link(field, search)
    if field.class != String
      helpers.sort_link(search, field, {}, method: action)
    else
      field
    end
  end

  def rest_actions(class_type)
    (tag.th link_to 'Edit', public_send('edit_' + class_type.class.to_s.split(/(?=[A-Z])/).map(&:downcase).join('_') + '_path', class_type), class: 'btn btn-primary') +
      (tag.th link_to 'Delete', class_type, method: 'delete', class: 'btn btn-danger', data: { confirm: 'Are you sure?', disable_with: 'Deleting....' })
  end
end
