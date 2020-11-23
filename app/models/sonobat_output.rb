# frozen_string_literal: true

class SonobatOutput < ApplicationRecord
  belongs_to :deployment

  def self.search(search)
    print('*******USING SEARCH FUNCTION**********')
    if search
      where(["manual_idspp1 LIKE ?", "%#{search}%"])
    else
      all
    end
  end
  
end
