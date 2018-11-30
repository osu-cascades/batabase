require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#placeholder_if_blank' do
    it 'returns tilde if argument is empty string' do
      expect(helper.placeholder_if_blank('')).to eq('~')
    end

    it 'returns tilde if argument is nil' do
      expect(helper.placeholder_if_blank(nil)).to eq('~')
    end

    it 'returns tilde if argument is false' do
      expect(helper.placeholder_if_blank(false)).to eq('~')
    end

    it 'returns argument value if not blank' do
      expect(helper.placeholder_if_blank('Example Value')).to eq('Example Value')
    end
  end
end
