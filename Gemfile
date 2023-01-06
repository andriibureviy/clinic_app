source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "cancancan"
gem "devise"
gem "devise_token_auth", github: "lynndylanhurley/devise_token_auth"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "pry"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "turbo-rails"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "pry"
  gem "factory_bot_rails"
  gem "capybara"
  gem "rspec-rails"
end

group :development do
  gem "web-console"
  gem "pry"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "database_cleaner", "~> 1.7"
  gem "rails-controller-testing"
end

