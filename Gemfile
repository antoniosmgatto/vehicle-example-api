# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "bootsnap", ">= 1.4.4", require: false
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.3", ">= 6.1.3.2"

# gem "jbuilder", "~> 2.7"
# gem 'bcrypt', '~> 3.1.7'
# gem "rack-cors"

group :development, :test do
  gem "awesome_print"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
  gem "pry-rails"
  gem "relaxed-rubocop", require: false
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "listen", "~> 3.3"
  gem "solargraph", require: false
end

group :test do
  gem "capybara", require: false
  gem "rspec-rails", require: false
  gem "selenium-webdriver", "~> 3.142", require: false
  gem "shoulda-matchers", require: false
  gem "webdrivers", "~> 4.0", require: false
end
