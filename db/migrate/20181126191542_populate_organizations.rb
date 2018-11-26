class PopulateOrganizations < ActiveRecord::Migration[5.2]
  def change
    Contact.distinct.pluck(:organization).each do |org|
      Organization.create!(label: org) unless Organization.where(label: org).first != nil
    end
  end
end
