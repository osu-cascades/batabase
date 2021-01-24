class Table < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :specifications, dependent: :destroy
    has_many :flexible_searches, through: :specifications
end
