class County < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  belongs_to :state

  def get_state
    self.state.name
  end

  def get_abbreviation
    self.state.abbreviation
  end
end
