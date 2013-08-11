#
# Cookbook Name:: nginx
# Recipe:: vhost
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/nginx/vhost.d/vhost.conf' do
  owner 'root'
  mode 0644
end

