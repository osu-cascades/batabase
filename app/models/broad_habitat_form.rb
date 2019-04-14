class BroadHabitatForm < ApplicationRecord
  validates :label, presence: true
  belongs_to :broad_habitat

  def broad_habitat_label
    broad_habitat.try(:label)
  end

end
