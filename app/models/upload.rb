# frozen_string_literal: true

class Upload < ApplicationRecord
  validates :data, presence: true, allow_blank: false
  validates :filename, presence: true, allow_blank: false, format: { with: /.csv\z/i, message: 'Only CSV files are allowed' }
  validates :upload_type, presence: true, allow_blank: false, inclusion: { in: %w[meta sono] }
end
