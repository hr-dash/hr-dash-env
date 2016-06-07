username = node['rbenv']['user']
include_recipe "rbenv::system"

remote_file "/etc/profile.d/rbenv.sh" do
  action :create
  owner username
  group username
end
