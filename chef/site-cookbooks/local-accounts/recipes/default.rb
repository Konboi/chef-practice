#
# Cookbook Name:: local-accounts
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
group "homepage" do
  gid 600
end

node[:local_accounts][:users].each do |username|
  include_recipe "local-accounts::#{username}"
end

group "wheel" do
  members node[:local_accounts][:wheels]
end
