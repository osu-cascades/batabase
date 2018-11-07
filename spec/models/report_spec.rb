require 'rails_helper'

RSpec.describe Report, type: :model do
  subject(:report) { Report.new(report_label: 'Example Label', report_name: 'Example Name') }

  describe 'validations' do
    %i(report_label report_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    %i(report_label report_name).each do |attribute|
      it {should validate_length_of(attribute).is_at_most(255)}
    end
  end
end
