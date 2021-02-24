source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'dry-validation', '~> 1.5'
gem 'dry-types', '~> 1.4'
gem 'jsonapi-serializer', '~> 2.1'
gem 'jwt_sessions', '~> 2.5'
gem 'trailblazer', '~> 2.1'
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3'
# gem 'redis', '~> 4.2'
# gem 'redis-store', '~> 1.9'
gem 'seedbank', '~> 0.5.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '~> 1.5'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'fasterer', '~> 0.8.3'
  gem 'ffaker', '~> 2.17'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 4.0'
  gem 'rubocop', '~> 1.3'
  gem 'rubocop-rspec', '~> 2.0'

end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
