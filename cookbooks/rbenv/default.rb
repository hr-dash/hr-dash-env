username = node['rbenv']['user']
include_recipe "rbenv::user"

remote_file "/home/#{username}/.bashrc"
