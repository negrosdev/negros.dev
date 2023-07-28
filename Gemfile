source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.6'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'administrate'
gem 'administrate-field-active_storage', '~> 0.4.2'
gem 'bootsnap', require: false
gem 'devise', '~> 4.9'
gem 'friendly_id', '~> 5.5'

# gem "sassc-rails"

gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'bundler-audit', '~> 0.9.1'
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'rubocop', '~> 1.52', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
end
