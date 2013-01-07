source 'https://rubygems.org'

gem 'rails', '3.2.8'

# database
gem 'mongoid', '~> 3.0.16'
gem 'bson_ext', '~> 1.8.1'

# authentication & authorization
gem 'devise', '~> 2.1.2'
gem 'cancan', '~> 1.6.8'

# images
gem 'carrierwave', '~> 0.7.0'
gem 'carrierwave-mongoid', '~> 0.1.0', :require => 'carrierwave/mongoid'
gem 'mini_magick'

# front-end
gem 'slim-rails', '~> 1.1.0'
gem 'jquery-rails', '2.1.4'
gem 'rails_config', '0.3.1'
gem 'simple_form', '2.0.4'
gem 'responders', '0.9.3'
gem 'rdiscount', '~> 1.6.8'
# gem 'bluecloth'

group :development do
  gem 'pry', '0.9.10'
  gem 'pry-nav'
  gem 'awesome_print', :require => 'ap'
  gem 'magic_encoding'
  gem 'foreman'
end

group :assets do
  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails', '2.2.3'
  gem 'twitter-bootstrap-rails', '2.1.6'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'rspec-rails', '2.11.4'
  gem 'capybara', '2.0.1'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem 'webmock'
end

# server
gem 'unicorn', '~> 4.4.0'

# deploy
gem 'capistrano'
