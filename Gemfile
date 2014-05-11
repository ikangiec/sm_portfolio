source "https://rubygems.org"

gem "jbuilder", "~> 2.0" # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jquery-rails" # Use jquery as the JavaScript library
gem "minitest-rails"
gem "rails", "4.1.1" # Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "sqlite3" # Use sqlite3 as the database for Active Record
gem "therubyracer", platforms: :ruby
gem "turbolinks"

# group :production do
#   gem "pg"
#   gem "rails_12factor"
# end

# Gems used only for assets and not required in production environments by default.
# allow everywhere for now cause we are allowing asset debugging in prd
group :assets do
  gem "coffee-rails", "~> 4.0.0" # Use CoffeeScript for .js.coffee assets and views
  gem "sass-rails", "~> 4.0.3" # Use SCSS for stylesheets
  gem "uglifier", ">= 1.3.0" # Use Uglifier as compressor for JavaScript assets
end

group :doc do
  gem "sdoc", "~> 0.4.0", require: false # bundle exec rake doc:rails generates the API under doc/api.
end

# group :test do
#   gem "minitest-rails-capybara"
#   gem "poltergeist"
# end

group :test, :development do
  gem "simplecov", require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry-rails"
  gem "spring" # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use unicorn as the app server
# gem "unicorn"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

# Use debugger
# gem "debugger", group: [:development, :test]

