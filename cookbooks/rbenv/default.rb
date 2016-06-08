include_recipe "rbenv::system"

remote_file "/etc/profile.d/rbenv.sh" do
  action :create
  mode '644'
end
