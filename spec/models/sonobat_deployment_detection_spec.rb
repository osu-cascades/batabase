require 'rails_helper'

RSpec.describe SonobatDeploymentDetection, type: :model do
  subject(:sonobat_deployment_detection) { build(:sonobat_deployment_detection) }

  describe 'validations' do
    it { should validate_presence_of(:night) }

    %i(path
      filename
      spp_accp
      spp
      tilde_prob
      calls_per_sec
      first
      second
      third
      fourth
      parent_dir
      next_dir_up
      filter
      manual_idspp1
      manual_idspp2
      notes).each do |attribute|
        it { should validate_length_of(attribute).is_at_most(255) }
      end
  end
end
