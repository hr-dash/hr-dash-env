execute 'add repo' do
  command 'rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm'
  not_if 'rpm -q nginx-release-centos-6-0.el6.ngx'
end

package 'nginx' do
  action :install
end

remote_file "/etc/nginx/conf.d/default.conf"

template "/etc/nginx/conf.d/web.conf" do
  variables(
    port: node[:nginx][:port],
    project_dir: node[:nginx][:project_dir],
    project_name: node[:nginx][:project_name],
  )
end
