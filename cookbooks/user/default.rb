name = node[:user][:name]
pass = node[:user][:password]
salt = node[:user][:salt]

user name do
  action :create
  user 'root'
  system_user true
  password pass.crypt(salt)
  create_home true
end
