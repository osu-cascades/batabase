class Upload < ApplicationRecord
  validates :file_name, presence: true, allow_blank: false
  validates :data, presence: true, allow_blank: false
  validates :upload_type, presence: true, allow_blank: false, inclusion: { in: [ "meta", "sono" ] }
end
