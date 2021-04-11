source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/negrosdev/negros.dev" }

ruby '2.7.3'

gem 'rails', '~> 6.1.3'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'rails_admin', '~> 2.0'
gem "pg", "~> 1.2"
gem "friendly_id", "~> 5.4"
gem "google-cloud-storage", "~> 1.11", require: false

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.35'
  gem 'factory_bot', '~> 6.1'
  gem 'faker', '~> 2.17'
  gem 'rspec-rails', '~> 5.0'
end


group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem "shoulda-matchers"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
