source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'

gem 'pg'

gem 'puma'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'

gem 'slim-rails'
gem 'bootstrap_form', github: 'yevhene/rails-bootstrap-forms', branch: 'alias_method_chain'

gem 'jbuilder', '~> 2.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

gem 'devise', '4.0.0.rc1'
gem 'devise_invitable', github: 'scambra/devise_invitable'

gem 'administrate', github: 'hayesr/administrate', branch: 'rails5_compat'
gem 'acts_as_list', '~> 0.7.2'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 3.0'

  gem 'letter_opener'

  gem 'listen', '~> 3.0.5'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rubocop', '~> 0.37.2'

  gem 'quiet_assets'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 0.4.8', require: nil
end

group :production do
  gem 'rails_12factor'
end
