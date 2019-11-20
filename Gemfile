source 'https://rubygems.org'

ruby '2.6.5'

source "https://rails-assets.org" do
  gem "rails-assets-bootstrap"
  gem "rails-assets-bootstrap-material-design"
  gem "rails-assets-knockout"
  gem "rails-assets-arrive"
end

# Rails i18n
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'rails-4-x'
# Use Puma as application server
gem 'puma'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.3'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # Use PostgreSQL as database
  gem 'pg'

  # Dummy database for asset precompilation
  gem 'activerecord-nulldb-adapter', :git => 'https://github.com/nulldb/nulldb.git'
end
