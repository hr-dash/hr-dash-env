execute 'add repo' do
  command 'rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm'
  not_if 'rpm -q nginx-release-centos-6-0.el6.ngx'
end

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
