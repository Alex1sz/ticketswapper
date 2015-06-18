source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'dotenv-rails', :groups => [:development, :test]
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# will_paginate gem for paginated ticket listings index
gem 'will_paginate', '~> 3.0.6'

# Use devise for user authentication
gem 'devise'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Stripe for payment processing
gem 'stripe'

# Sunspot for solr search
gem 'sunspot_rails'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rerun'
  gem 'rspec-rails', '~> 3.0'
  # purge data from db on every test run
  gem 'database_cleaner'
  gem 'rubocop'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'capybara'
  # sunspot_solr for pre-packaged Solr distribution for use in development
  gem 'sunspot_solr'
end

group :production do
  gem 'pg'
  gem 'unicorn', '4.9.0'
  gem 'timeout'
end
