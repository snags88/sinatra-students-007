# A Gemfile
source 'https://rubygems.org'
ruby '2.0.0'

gem 'sinatra', :require => 'sinatra/base'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sinatra-flash', :require => 'sinatra/flash'
gem 'activerecord', :require => 'active_record'
gem 'nokogiri'
gem 'require_all'
gem 'rake'
gem 'shotgun'
gem 'thin'
gem 'json'
gem 'simplecov'

group :development, :test do
  gem 'sqlite3'
  gem 'tux'
  gem 'pry'
  gem 'guard-rspec'
  gem 'rspec'
  gem 'capybara'
  gem 'terminal-notifier-guard'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  gem 'rack-test'
end

group :production do
  gem 'pg'
end
