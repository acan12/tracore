source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem "pg"
gem "whenever", require: false
gem 'omniauth-facebook'
gem 'jbuilder'
gem 'koala'
gem 'thin'

group :development do
  gem 'quiet_assets'
  gem 'pry-nav'
end

group :development, :test do 
  gem 'mailcatcher'
  gem 'rspec-rails'
  gem 'factory_girl_rails'  
end

group :test do 
  gem 'shoulda-matchers'
  gem 'terminal-notifier-guard'
  gem "guard-rspec"
  gem "guard-zeus"
  gem 'database_cleaner'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do  
  gem 'rails_12factor'
end
