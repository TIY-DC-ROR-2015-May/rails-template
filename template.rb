#%w(
#  quiet_assets
#  pry-rails
#).each { |g| gem g }
gem 'quiet_assets'
gem 'pry-rails'

gem_group :development do
  gem 'better_errors'
  gem 'did_you_mean'
end

# Move sqlite3 to development
comment_lines "Gemfile", /sqlite/
gem_group :development do
  gem 'sqlite3'
  gem 'binding_of_caller'
end
gem_group :production do
  gem 'pg'
  gem 'rails_12factor'
end

comment_lines "Gemfile", /byebug/
comment_lines "Gemfile", /web-console/

if yes?("Use devise?")
  gem 'devise'
  generate 'devise:install'
  generate 'devise', 'User'
end

after_bundle do
  git :init
  git add: "."
  git commit: "-m 'Initial commit'"
end
