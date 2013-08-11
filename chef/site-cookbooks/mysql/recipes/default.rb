#
# Cookbook Name:: mysql55
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
[ "mysql-devel", "mysql", "mysql-libs" ].each do |pkg|
  package pkg
end
