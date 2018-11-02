require 'rails_helper'

RSpec.describe KaleidoscopeDeploymentDetection, type: :model do
  subject(:kaleidoscope_deployment_detection) { build(:kaleidoscope_deployment_detection) }

  describe 'validations' do
    %i(deployment_id night).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    %i(folder
      in_file
      out_file
      auto_id
      alternates
      tbc
      fk
      s1
      tc
      manual_idspp1
      manual_idspp2
      notes).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(255) }
    end
  end
end
