#
# Cookbook Name:: mysql
# Recipe:: slave
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#execute "setting slave config" do
#  command "mysql -uroot -p#{node['mysql']['server_root_password']} -e \"CHANGE MASTER TO MASTER_HOST='#{node['mysql']['master_local_ip']}', MASTER_USER='repl', MASTER_PASSWORD='#{node['mysql']['master_repl_password']}', MASTER_LOG_FILE='#{node['mysql']['master_repl_log_file']}', MASTER_LOG_POS=#{node['mysql']['master_repl_log_pos']}; SLAVE START;\""
#  action :run
#  only_if "mysql -uroot -p#{node['mysql']['server_root_password']} -e \"SHOW SLAVE STATUS\" | grep \"Slave_\" | grep \"No\" "
#end



bash "setting slave" do
  if node['mysql']['server_type'] == 'slave'
    code <<-EOC
      mysql -u'#{node['mysql']['server_repl_username']}' -p'#{node['mysql']['server_repl_password']}' --all-database > /tmp/dump.db
      mysql -u'root' -p'#{node['mysql']['server_root_password']}' < /tmp/dump.db
      mysql -u'root' -p'#{node['mysql']['server_root_password']}' -e "STOP SLAVE; CHANGE MASTER TO MASTER_HOST='#{node['mysql']['master_local_ip']}', MASTER_USER='repl', MASTER_PASSWORD='#{node['mysql']['master_repl_password']}', MASTER_LOG_FILE='#{node['mysql']['master_repl_log_file']}', MASTER_LOG_POS=#{node['mysql']['master_repl_log_pos']}; SLAVE START;"
    EOC
  else
    code <<-EOC
      mysql -u'root' -p'#{node['mysql']['server_root_password']}' -e "STOP SLAVE; CHANGE MASTER TO MASTER_HOST='#{node['mysql']['master_local_ip']}', MASTER_USER='repl', MASTER_PASSWORD='#{node['mysql']['master_repl_password']}', MASTER_LOG_FILE='#{node['mysql']['master_repl_log_file']}', MASTER_LOG_POS=#{node['mysql']['master_repl_log_pos']}; SLAVE START;"
    EOC
  end

  not_if "mysql -u'root' -p'#{node['mysql']['server_root_password']}' -e 'SHOW SLAVE STATUS \\G' | grep 'Slave_.*_Running: Yes'"
end
