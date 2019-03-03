class ContactDecorator < ApplicationDecorator
  delegate_all

  def name
    "#{first_name} #{last_name}"
  end

end
