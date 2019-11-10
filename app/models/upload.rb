class Upload < ApplicationRecord
  validates :data, presence: true, allow_blank: false
end
