# README

This is the Prototype of "Les Bons Amis"

Ruby version: 2.4.1

Rails version: 5.1.3

Base SQLite version: 3.20.1

gem 'sqlite3'  
gem 'puma', '~> 3.7'  
gem 'sass-rails', '~> 5.0'  
gem 'uglifier', '>= 1.3.0'  
gem 'coffee-rails', '~> 4.2'  
gem 'turbolinks', '~> 5'  
gem 'jbuilder', '~> 2.5'  
gem 'bcrypt', '~> 3.1.7'  
gem 'money-rails', '~>1'  

:development, :test  
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  
  gem 'capybara', '~> 2.13'  
  gem 'selenium-webdriver'  
  gem 'pry-rails'  

group :development  
  gem 'web-console', '>= 3.3.0'  
  gem 'listen', '>= 3.0.5', '< 3.2'  
  gem 'spring'  
  gem 'spring-watcher-listen', '~> 2.0.0'  

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]  
