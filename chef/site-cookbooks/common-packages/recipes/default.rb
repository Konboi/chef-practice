#
# Cookbook Name:: common-packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "curl"
package "gcc-c++"
package "libpng"
package "libpng-devel"
package "giflib"
package "giflib-devel"
package "libjpeg"
package "subversion"
package "telnet"
package "nc"
package "iotop"
package "dstat"
package "vim-enhanced"
package "ack"
package "mlocate"
package "sysstat"
package "file"
package "lsof"
package "git"
package "ngrep"
package "libmemcached"
package "libmemcached-devel"
package "bind-utils"
package "strace"
package "tmux"
package "irqbalance"
package "screen"
package "ImageMagick"
package "ImageMagick-devel"

service "irqbalance" do
      action [:enable, :start]
end

node[:common_packages][:install].each do |pkg|
  package pkg
end
