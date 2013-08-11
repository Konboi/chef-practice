package "mysql-server"

cookbook_file "/etc/logrotate.d/mysqld" do
  owner "root"
  mode 0644
  source "logrotate_mysqld"
end

service "mysqld" do
  action [:enable, :start]
end
