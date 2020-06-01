# Batabase [![Build Status](https://travis-ci.org/osu-cascades/batabase.svg?branch=develop)](https://travis-ci.org/osu-cascades/batabase)

Database of bat population data for the Northwestern Bat Hub.

## Getting Started

### Requirements

Below are requirements and their versions running this project locally. It is up to you to setup any required tools that you may need.

- Postgresql: `10`
- Ruby: `2.6.5`
- Repo: `git@github.com:osu-cascades/batabase.git`
- Bundler: `2+`

### First Time Setup

- Set local ruby version either via rvm `rvm use ruby-2.6.5` or rbenv `rbenv local 2.6.5`
- Install gems: `bundle install` (If this fails ensure you have bundler installed. Bundler 2+ suggested)
- Build the database: `rake db:create db:migrate db:seed` (If this fails ensure that you have a postgres database created for your \$USER account)
- Run the server: `rails s`

### Test Coverage

Batabase uses the [simplecov](https://github.com/colszowka/simplecov) gem to supply code coverage metrics.
To view code coverage run the test suite by running `rspec` or `rspec -f d` (this one is personally preferred) and open `coverage/index.html` in a browser.

## Data model

![erd](erd.png?raw=true)

## Libaries and Structure
### GitHub Components
To construct some of the various views withint the application, we used GitHub's [ViewComponent](https://github.com/github/view_component) framework. Using the ViewComponent framework allows the creation of generic view components similar to the way React components work.

For example here is the class for our generic form component used for updates and creation of new tables which lives at `app/components/create_update_form_component.rb`:
```Ruby
class CreateUpdateFormComponent < ApplicationComponent
  def initialize(model, fields, header_text)
    @model = model
    @fields = fields
    @header_text = header_text
  end
end
```
And it's corresponding view template at `app/components/create_update_form_component.html.rb`:
```Ruby
<div class="container my-3">
  <h3><%= @header_text %></h3>
  <%= bootstrap_form_with(model: @model, label_errors: true, inline_errors: true, local: true) do |f| %>
    <% @fields.each do |field| %>
      <%= f.send(field[:type], field[:name], field.fetch(:options)) %>
    <% end %>
    <%= f.submit "#{@header_text}" %>
  <% end %>
</div>
```
Then in a view you can simply render the component as seen in `app/views/contacts/edit.html.erb`:
```Ruby
<%= render(CreateUpdateFormComponent.new(@model, @fields, @header_text)) %>
```
### Ransack
In order to allow the various tables to be queried from the front end, we used a rails gem called [Ransack](https://github.com/activerecord-hackery/ransack). Ransack is very extensible and allows the creation of powerful forms which allow table querying.

For example here is the index view for Contacts at `app/views/contacts/index.html.erb` where there is a `search_form_for` helper:
```Ruby
<div class="d-flex fixed-header p-3">
  <div class="col-auto">
    <div class="card bg-light">
      <div class="card-header">
        <%= tag.h1 'Search Contacts' %>
      </div>
      <div class="card-body">
        <%= search_form_for @search do |f| %>
          <%= tag.fieldset do %>
            <%= tag.legend 'Contact' %>
            <%= tag.ul do %>
              <%= tag.li do %>
                <%= f.label :first_name_or_last_name_cont %>
                <%= f.text_field :first_name_or_last_name_cont %>
              <% end %>
              <%= tag.li do %>
                <%= f.label :notes_cont %>
                <%= f.text_field :notes_cont %>
              <% end %>
            <% end %>
          <% end %>
          <%= tag.fieldset do %>
            <%= tag.legend "Contact's Organization" %>
            <%= tag.ul do %>
              <%= tag.li do %>
                <%= f.label :organization_name_cont %>
                <%= f.text_field :organization_name_cont %>
              <% end %>
            <% end %>
          <% end %>
          <%= f.submit class: 'btn btn-dark' %>
        <% end %>
      </div>
    </div>
  </div>
  <div class="d-flex flex-column align-items-center">
    <%= render(TableComponent.new(@fields, @headers, @helpers, @contacts, @search)) %>
  </div>
</div>
```

Then in the controller for Contacts there are the methods that generate the params and results for the query:
```Ruby
def ransack_params
  Contact.includes(:organization).ransack(params[:q])
end

def ransack_result
  @search.result.page(params[:page])
end
```
Which get called when the hitting the index controller action:
```Ruby
def index
  @fields = FIELDS
  @headers = HEADERS
  @helpers = helpers
  @search = ransack_params
  @contacts = ransack_result
end
```
Then the results can be passed into our table component to be rendered in the index view.

&copy; 2019 Dylan Drudge, Bryce Graves, Mack Hatfield, Nathan Struhs. All rights reserved.
