name = node[:user][:name]
pass = node[:user][:password]
salt = node[:user][:salt]
wheel_gid = '10'

user name do
  action :create
  user 'root'
  system_user true
  password pass.crypt(salt)
  create_home true
end

user name do
  gid wheel_gid
end
