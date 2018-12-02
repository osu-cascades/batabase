class StudyArea < ApplicationRecord
  validates :name, presence: true
  belongs_to :state

  def state_code
    state.try(:state_code)
  end
end
