#
# Cookbook Name:: mysql
# Recipe:: server
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server"

service 'mysqld' do
  supports :restart => true
  action [:enable, :start]
end

template "/etc/my.cnf" do
  mode  '0644'
  owner 'root'
  group 'root'
  notifies :restart, "service[mysqld]", :immediately
end

execute "assign-root-password" do
  command "#{node['mysql']['mysqladmin_bin']} -u root password #{node['mysql']['server_root_password']}"
  action :run
  only_if "mysql -u root -e 'show databases;'"
end

if node['mysql']['replication']
  execute "create repl user" do
    sleep(5)
    command "mysql -uroot -p#{node['mysql']['server_root_password']} -e \"GRANT REPLICATION SLAVE ON *.* TO '#{node['mysql']['server_repl_username']}'@'%' IDENTIFIED BY '#{node['mysql']['server_repl_password']}';\""
    action :run
    not_if "mysql -uroot -p#{node['mysql']['server_root_password']} -e \"SELECT user FROM mysql.user;\" | grep repl"
  end
end
