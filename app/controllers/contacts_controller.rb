class ContactsController < ApplicationController
  def index
    @contacts_grid = ContactsGrid.new(params[:contacts_grid])
  end
end