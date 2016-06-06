username = node['rbenv']['user']
include_recipe "rbenv::user"

remote_file "/home/#{username}/.bashrc" do
  action :create
  owner username
  group username
end
