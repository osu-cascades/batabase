class FlexibleSearch < ApplicationRecord
    belongs_to :state
    belongs_to :sonobat_output
    belongs_to :deployment
    belongs_to :detector
end
