source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use sqlite3 / pgsql as the database for Active Record
gem 'sqlite3', group: :development
gem 'pg', group: :production
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'gorg_engine', '>= 1.2.2', github: 'gadzorg/GorgEngine'
gem 'simple_form-materialize', github: 'patricklindsay/simple_form-materialize'
gem 'configurable_engine', github: 'Blaked84/configurable_engine'
gem "omniauth-cas", :git => "https://github.com/loocla/omniauth-cas.git", :branch => 'saml'
gem "awesome_print", require:"ap"

gem "i18n"

gem 'thumbs_up'

gem 'vuejs-rails'

gem 'typedjq-rails'

gem 'draper'

gem 'momentjs-rails'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

end

group :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'poltergeist'
  #code coverage
  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0"

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
  gem 'heroku_secrets', github: 'alexpeattie/heroku_secrets'
end

ruby "2.4.0"