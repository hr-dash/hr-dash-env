package 'nginx' do
  action :install
end

# remote_file "/etc/nginx/conf.d/web.conf"

service 'nginx' do
  action :restart
end