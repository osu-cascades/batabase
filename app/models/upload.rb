class Upload < ApplicationRecord
  validates :data, presence: true, allow_blank: false
  validates :type, presence: true, allow_blank: false, inclusion: { in: [ "meta", "sono" ]
end
