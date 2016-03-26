
txt = <<-TXT

      ＿人人人人人人人人人人人人人人人＿
      ＞　Rails Application Templates　＜
      ￣Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^YY^Y￣

TXT
puts txt

# Gemfileに追加
gem 'therubyracer', platforms: :ruby
gem 'capybara'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'bootstrap_form'
gem 'execjs'
gem 'slim-rails'
gem 'view_source_map'
gem 'faker'
gem 'pry-byebug'
gem 'devise'


# Gemfileに追加(test,development)
gem_group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov' if yes?('use simplecov ?')
end

# rspec初期設定
inside('') do
  run 'bundle install --path vendor/bundle'
  run 'rm -rf test'
  generate 'rspec:install'
end

# factory_girl初期設定
uncomment_lines 'spec/rails_helper.rb', /Dir\[Rails\.root\.join/
get "~/rails_template/spec/support/factory_girl.rb", 'spec/support/factory_girl.rb'

# scaffold
# generate 'scaffold users user_id:string name:string mail_addr:string'

# bootstrap設定
generate 'bootstrap:install less'
generate 'bootstrap:layout application fluid'
generate 'bootstrap:themed users'

# devise初期インストール
generate 'devise:install'
generate 'devise:views'
generate 'devise users'
