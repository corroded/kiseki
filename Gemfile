source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'uglifier'

gem 'jquery-rails'

#layout
gem "haml", ">= 3.1.2"
gem "haml-rails", ">= 0.3.4", :group => :development
gem 'compass', :git => 'https://github.com/chriseppstein/compass.git', :branch => 'rails31'
gem "formtastic"
gem 'html5-rails', :git => 'git://github.com/sporkd/html5-rails.git'

gem "devise", ">= 1.3.4"

#misc APIs
gem 'rainmaker'
gem 'twitter'

#heroku
gem 'heroku'

group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3'
end

gem "ruby-debug19"

group :development do
  gem "rails-footnotes", ">= 3.7"
  gem 'annotate', :git => "https://github.com/ctran/annotate_models.git"
  gem "rspec-rails", ">= 2.0.1"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'capybara', ">= 1.0.0"
  gem 'database_cleaner', ">= 0.6.7"
  gem 'cucumber-rails', ">= 1.0.0"
  gem 'cucumber'
  gem 'factory_girl_rails'
  gem 'rspec'
  gem "rspec-rails", ">= 2.0.1"
  gem 'spork'
  gem 'launchy', ">= 0.4.0"    # So you can do Then show me the page
  gem 'email_spec'
end