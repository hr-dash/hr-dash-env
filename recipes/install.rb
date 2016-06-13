require 'pry'

recipes = %w(
  user
  rbenv
  nodejs
  nginx
  postgres
)

recipes.each do |recipe|
  include_recipe "../cookbooks/#{recipe}/default.rb"
end
