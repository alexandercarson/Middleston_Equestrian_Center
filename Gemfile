source 'https://rubygems.org'

ruby '2.6.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :test do
  gem 'coveralls', require: false
  gem 'database_cleaner'
end


#bootstrap
gem 'font-awesome-sass', '~> 5.6.1'
gem 'bootstrap', '~> 4.2.1'
gem "bootstrap_form", ">= 4.1.0"
gem 'sprockets-es6'
#pdf
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'wkhtmltopdf-binary-edge'
#javascript/jquery
gem 'jquery_mask_rails', '~> 0.1.0'
gem 'jquery-rails'
#other
gem 'notifications', '~> 0.6.0'
gem 'sweet-alert-confirm'
gem 'sweetalert2'
gem "nifty-generators"
gem 'httparty'
gem 'figaro'
gem 'toastr-rails'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'rails-assets-foundation', source: 'https://rails-assets.org'
gem 'simple_form'
gem 'devise'
gem 'foundation-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'mini_racer', platforms: :ruby
gem 'hirb'
gem 'pundit'
gem 'jquery-fileupload-rails'
gem 'mysql2'
gem 'bundler', '~> 2.0', '>= 2.0.1'
gem 'jquery-timepicker-rails'


#stripe
gem 'stripe'
gem 'stripe_event'
gem "money-rails"


# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
 gem 'bcrypt', '~> 3.1.7'

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
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'rails-controller-testing'
  gem 'stripe-ruby-mock'
end

group :production do
  gem 'rails_12factor'
  gem 'carrierwave'
end

gem 'mocha', group: :test
