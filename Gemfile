source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'mysql2', '~> 0.5'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'faker', '2.1.2'
gem 'jquery-rails'
gem 'will_paginate', '3.1.8'
gem 'chart-js-rails', '~> 0.1.4'
gem 'gon', '~> 6.2.0'
gem 'carrierwave'
gem 'mini_magick'
gem 'bootstrap', '~> 5.0.0.alpha1'
gem 'rakuten_web_service'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # gem 'mysql2', '1.4.1'
  gem 'rubocop', require: false
  gem 'rspec-rails', '~> 4.0.0'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :production do
  gem 'unicorn', '5.6'
end