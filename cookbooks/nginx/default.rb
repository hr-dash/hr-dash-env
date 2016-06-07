package 'nginx' do
  action :install
end

template "/etc/nginx/conf.d/web.conf" do
  variables(
    port: 8080,
    project_dir: '/var/www/',
    project_name: 'hr-dash',
  )
end
