recipes = %w(
  rbenv
)

recipes.each do |recipe|
  include_recipe "../cookbooks/#{recipe}/default.rb"
end
