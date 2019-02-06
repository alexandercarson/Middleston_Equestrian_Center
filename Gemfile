source 'https://rubygems.org'

ruby '2.6.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :test do
  gem 'coveralls', require: false
  gem 'database_cleaner'
end

#jquery
gem 'jquery-rails'
#bootstrap
gem 'font-awesome-sass', '~> 5.6.1'
gem 'bootstrap', '~> 4.2.1'
gem "bootstrap_form", ">= 4.1.0"
gem 'sprockets-es6'
#pdf
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'wkhtmltopdf-binary-edge'
#other
gem "nifty-generators"
gem 'httparty'
gem 'figaro'
gem 'toastr-rails'
gem 'cancancan', '~> 2.0'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'rails-assets-foundation', source: 'https://rails-assets.org'
gem 'simple_form'
gem 'devise'
gem 'foundation-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'mini_racer', platforms: :ruby
gem 'mysql2'
#stripe
gem 'stripe'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen', '~> 3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'capybara'
  gem 'factory_bot', '~> 4.11', '>= 4.11.1'
  gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
  gem 'faker', github: 'stympy/faker'
  gem 'launchy', require: false
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'rails-controller-testing'
end

group :production do
  gem 'rails_12factor'
  gem 'mysql2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mocha', group: :test
