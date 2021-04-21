source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 6.1', '>= 6.1.3.1'
gem 'sinatra-activerecord', '~> 2.0', '>= 2.0.22'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'sinatra-flash'
gem 'dotenv'
gem 'foreman'

group :development do
  gem 'sqlite3', '~> 1.4', '>= 1.4.2'
  gem 'tux'
  gem 'shotgun'
  gem 'pry'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
