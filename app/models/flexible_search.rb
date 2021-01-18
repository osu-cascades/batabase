class FlexibleSearch < ApplicationRecord

    has_many :specifications, dependent: :destroy
    has_many :tables, through: :specifications

end
