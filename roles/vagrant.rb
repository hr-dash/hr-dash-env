recipes = %w(
  rbenv
  nginx
  postgres
)

recipes.each do |recipe|
  include_recipe "../cookbooks/#{recipe}/default.rb"
end
