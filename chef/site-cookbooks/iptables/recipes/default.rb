#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "iptables" do
  action :install
end

service "iptables" do
  supports :status => true, :restart => true, :reload => true, :stop => true
  action [:disable, :stop]
end

template "iptables.conf" do
  path "/etc/sysconfig/iptables"
  source "iptables.conf.erb"
  owner "root"
  group "root"
  mode 0600
end
