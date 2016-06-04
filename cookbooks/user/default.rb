user 'web' do
  action :create
  user 'root'
  password 'password'
  system_user true
  create_home true
end
