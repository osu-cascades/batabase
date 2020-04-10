# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GlobalHeaderComponent, type: :component do
  signed_in = [
    'Batabase',
    'Uploads',
    'Detectors',
    'Contacts',
    'Deployments',
    'Edit Profile',
    'Sign Out'
  ]

  signed_out = [
    'Sign Up',
    'Sign In'
  ]

  it 'signed in specific links visable when signed in' do
    render_inline(GlobalHeaderComponent.new(signed_in: true))

    signed_in.each do |link|
      expect(page).to have_link(link)
    end
  end

  it 'signed out specific links visable when signed out' do
    render_inline(GlobalHeaderComponent.new(signed_in: false))

    signed_out.each do |link|
      expect(page).to have_link(link)
    end
  end
end
