source 'https://rubygems.org'

ruby '2.6.5'

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repo_name}.git'
end

gem 'activerecord-import'
gem "aws-sdk-s3", require: false
gem 'axlsx_rails'
gem 'bootsnap', require: false
gem 'devise'
gem 'dotenv-rails'
gem 'draper'
gem 'jbuilder'
gem 'kaminari'
gem 'pg'
gem 'puma'
gem 'rails', '~> 6.0.0'
gem 'rails_db'
gem 'webpacker'
gem 'solargraph'


group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'letter_opener'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'webdrivers'
end

group :development do
  gem 'byebug'
  gem 'guard-rspec', require: false
  gem 'listen'
  gem "rails-erd"
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
  gem 'travis'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
