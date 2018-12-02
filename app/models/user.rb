class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enum role: [:guest, :field_agent, :admin]
  after_initialize :set_default_role, if: :new_record?

  belongs_to :state
  belongs_to :organization

  validates :first_name, :last_name, presence: true

  def organization_label
    organization.try(:label)
  end

  def state_name
    state.try(:state_name)
  end

  def role_humanized
    role.humanize
  end

  private

  def set_default_role
    self.role ||= :guest
  end
end
