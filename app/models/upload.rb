class Upload < ApplicationRecord
  validates :data, presence: true, allow_blank: false
  validates :filename, presence: true, allow_blank: false
  validates :upload_type, presence: true, allow_blank: false, inclusion: { in: [ "meta", "sono" ] }
end
