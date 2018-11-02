class KaleidoscopeDeploymentDetection < ApplicationRecord
  validates :deployment_id, :night, presence: true
  validates_length_of :folder,
                      :in_file,
                      :out_file,
                      :auto_id,
                      :alternates,
                      :tbc,
                      :fk,
                      :s1,
                      :tc,
                      :manual_idspp1,
                      :manual_idspp2,
                      :notes,maximum: 255
end
