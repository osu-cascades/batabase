source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repo_name}.git'
end

gem 'bootsnap', require: false
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.2.1'
gem 'sass-rails', '~> 5.0'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
  gem 'letter_opener'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'simplecov'
  gem 'webdrivers'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
