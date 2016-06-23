def restart_postgres(ver)
  [:enable, :restart].each do |act|
    service "postgresql-#{ver}" do
      action act
    end
  end
end

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
package "postgresql-devel"

execute "initdb" do
  command "service postgresql-#{ver} initdb"
end

#####################
# Set Password
#####################
template "/var/lib/pgsql/#{ver}/data/pg_hba.conf" do
  owner 'postgres'
  group 'postgres'
  variables(auth_method: :trust)
end
restart_postgres(ver)

execute "set password" do
  user = node[:postgresql][:user]
  password = node[:postgresql][:password]
  command "psql -U #{user} -c \"ALTER ROLE #{user} WITH PASSWORD '#{password}';\""
end

#####################
# Reset pg_hba.conf
#####################
template "/var/lib/pgsql/#{ver}/data/pg_hba.conf" do
  owner 'postgres'
  group 'postgres'
  variables(auth_method: :md5)
end
restart_postgres(ver)

