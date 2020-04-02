# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GlobalHeaderComponent, type: :component do
  # TODO: make this better and add user specific tests once added.

  all_links = [
    'Batabase',
    'Uploads',
    'Detectors',
    'Contacts',
    'Deployments'
  ]

  it 'contains important navigation links' do
    render_inline(GlobalHeaderComponent.new)

    all_links.each do |link|
      expect(page).to have_link(link)
    end
  end
end
