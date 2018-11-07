class SonobatDeploymentDetection < ApplicationRecord
  validates :night, presence: true
  validates_length_of :path,
                      :filename,
                      :spp_accp,
                      :spp,
                      :tilde_prob,
                      :calls_per_sec,
                      :first,
                      :second,
                      :third,
                      :fourth,
                      :parent_dir,
                      :next_dir_up,
                      :filter,
                      :manual_idspp1,
                      :manual_idspp2,
                      :notes, maximum: 255
end
