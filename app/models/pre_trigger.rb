class PreTrigger < ApplicationRecord
  validates :delay, numericality: true
end