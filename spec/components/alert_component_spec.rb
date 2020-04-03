# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlertComponent, type: :component do
  let(:default_alert) { render_inline(AlertComponent.new(message: 'FAKE MESSAGE')) }

  context 'Alert Defaults' do
    it 'is not dismissible' do
      expect(default_alert.at_css('[id="alert-button"]')).to be_nil
    end

    it 'has no header' do
      expect(default_alert.at_css('[id="alert-header"]')).to be_nil
    end

    it 'returns an empty component without a message' do
      component = render_inline(AlertComponent.new)

      expect(component.children.empty?).to be_truthy
    end

    it 'has type primary' do
      expect(default_alert.at_css('[id="alert"]').first.last.include?('primary')).to be true
    end
  end

  context 'Alert Customization' do
    it 'has a dismiss button when dismissible' do
      component = render_inline(AlertComponent.new(dismissible: true, message: 'FAKE MESSAGE'))

      expect(component.at_css('[id="alert-button"]')).not_to be_nil
    end

    it 'has assigned heading' do
      component = render_inline(AlertComponent.new(heading: 'FAKE HEADING', message: 'FAKE MESSAGE'))

      expect(component.at_css('[id="alert-heading"]').text).to eq('FAKE HEADING')
    end

    it 'has assigned message' do
      expect(default_alert.at_css('[id="alert-message"]').text).to eq('FAKE MESSAGE')
    end

    it 'has assigned styling' do
      component = render_inline(AlertComponent.new(styling: 'FAKE STYLING', message: 'FAKE MESSAGE'))

      expect(component.at_css('[id="alert"]').first.last.include?('FAKE STYLING')).to be true
    end

    it 'has adopts an accepted type' do
      component = render_inline(AlertComponent.new(message: 'FAKE MESSAGE', type: :danger))

      expect(component.at_css('[id="alert"]').first.last.include?('danger')).to be true
    end

    it 'cannot adopt a non-allowed type' do
      expected_message = 'FAKE_TYPE is invalid. Allowed values: primary, secondary, success, danger, warning, info, light, dark.'

      expect { render_inline(AlertComponent.new(message: 'FAKE MESSAGE', type: :FAKE_TYPE)) }.to raise_error(RuntimeError, expected_message)
    end
  end
end
