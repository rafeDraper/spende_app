# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'activerecord-session_store'
gem 'bootsnap',                   '1.4.6', require: false
gem 'bootstrap-sass',             '3.4.1'
gem 'devise',                     '4.7.2'
gem 'faker',                      '2.13.0'
gem 'flatpickr',                  '4.6.3.1'
gem 'font_awesome5_rails',        '1.1.1'
gem 'jbuilder',                   '2.10.0'
gem 'money-rails',                '1.13.3'
gem 'omniauth',                   '1.9.1'
gem 'omniauth-google-oauth2',     '0.8.0'
gem 'puma',                       '4.3.5'
gem 'pundit',                     '2.1.0'
gem 'rails',                      '6.0.3.2'
gem 'rails-i18n',                 '~> 6.0.0'
gem 'sass-rails',                 '6.0.0'
gem 'slim-rails',                 '3.2.0'
gem 'turbolinks',                 '5.2.1'
gem 'webpacker',                  '5.1.1'

group :development, :test do
  gem 'byebug', '11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'sqlite3', '1.4.2'
end

group :development do
  gem 'listen',                '3.2.1'
  gem 'web-console',           '4.0.3'
end

group :test do
  gem 'capybara', '3.33.0'
  gem 'guard', '2.16.2'
  gem 'launchy'
  gem 'pundit-matchers', '~> 1.6.0'
  gem 'rails-controller-testing', '1.0.5'
  gem 'selenium-webdriver',       '3.142.7'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers', '4.4.1'
end

group :production do
  gem 'pg', '1.2.3'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
