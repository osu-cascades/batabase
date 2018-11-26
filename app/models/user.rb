class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enum role: [:guest, :field_agent, :admin]
  after_initialize :set_default_role, if: :new_record?

  belongs_to :state
  belongs_to :organization

  private

  def set_default_role
    self.role ||= :guest
  end
end
