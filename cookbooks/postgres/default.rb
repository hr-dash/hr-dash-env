# PostgreSQL Install
ver = node[:postgresql][:ver]
short_ver = node[:postgresql][:short_ver]

package node[:postgresql][:pgdg] do
  not_if "rpm -q #{File.basename(node[:postgresql][:pgdg], ".rpm")}"
end

package "postgresql#{short_ver}"
package "postgresql#{short_ver}-server"
package "postgresql#{short_ver}-contrib"
package "postgresql#{short_ver}-devel"
package "postgresql#{short_ver}-libs"

execute "initdb" do
  command "service postgresql-#{ver} initdb"
  not_if "ls /var/lib/pgsql/"
end

[:enable, :restart].each do |act|
  service "postgresql-#{ver}" do
    action act
  end
end
