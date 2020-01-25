# frozen_string_literal: true

# TODO: alphabetize these

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 4.3'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Gems required for bootstrap
gem 'bootstrap'
gem 'jquery-rails'

# Gem that generates forms already in bootstrap style
gem 'bootstrap_form', '~> 4.0'

# Devise is a flexible authentication solution for Rails based on Warden. Doc: https://github.com/plataformatec/devise
gem 'devise'

# Activerecord import allows us to bulk import csv data into active record quickly and efficiently
gem 'activerecord-import'

# This in included with devise. Not sure if we can use it but I am leaving this for future me.
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'

  # Lets get some pride up in these tests
  gem 'rspec-pride'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Rubocop provides ruby and erb linting on save
  gem 'rubocop'

  # Solargraph is a language server that provides intellisense, code completion, and inline documentation for Ruby.
  gem 'solargraph'

  gem 'htmlbeautifier'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false

  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'

  # Used to create all caps number names for tests
  gem 'humanize'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
