source 'https://rubygems.org'

gem 'rails', '4.1.1'

gem 'pg', '0.17.1'
gem 'unicorn-rails', '2.1.1'

gem 'dotenv-rails', '0.11.1', groups: [:development, :test] # load before gems that use env

gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '3.1.0'
gem 'haml-rails', '0.5.3'

gem 'sass-rails', '4.0.3'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'bootstrap-datepicker-rails', '1.3.0.2'

gem 'postmark', '1.2.1'

gem 'yelp', '2.0.1'

group :development, :test do
  gem 'rspec-rails', '2.14.2'
  gem 'capybara', '2.2.1'
  gem 'selenium-webdriver', '2.42.0'
  gem 'pry'
end

group :production, :staging do
  gem 'rails_12factor'
end
