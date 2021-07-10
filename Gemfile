source 'https://rubygems.org'
git_source(:github) { |_repo| 'https://github.com/negrosdev/negros.dev' }

ruby '3.0.0'

gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'friendly_id', '~> 5.4'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3'
gem 'rails_admin', '~> 2.0'
gem 'rails_admin-i18n'
gem 'redcarpet'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 3.35'
  gem 'factory_bot_rails'
  gem 'faker', '~> 2.17'
  gem 'rspec-rails', '~> 5.0'
  gem 'rubocop-rspec', require: false
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'cuprite'
  gem 'rubocop-rails', require: false
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
