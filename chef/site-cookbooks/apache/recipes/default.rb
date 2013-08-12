#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'httpd'


directory '/etc/httpd/vhost.d/' do
  mode 0755
  owner 'apache'
  group 'apache'
  recursive true
end

template '/etc/httpd/conf/httpd.conf' do
  owner 'root'
  mode 0644
end

service 'httpd' do
  supports :graceful => true, :restart => true
  action [:enable, :start]
end



