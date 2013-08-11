username = "homepage"

user "#{username}" do
  uid 600
  gid 600
end

directory "/home/#{username}/.ssh" do
  mode 0700
  owner username
end

file "/home/#{username}/.ssh/authorized_keys" do
  mode 0600
  owner username
  content "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/5pRGNmR71xLAADbehNIqLqSkWlnvTp93jEFFiBybiwJYY4/ZTNwU1ZSAkrqDkcvx83RywVDO/dc1Njx4vdTuleGHcZ6v2v9t+nyj41b2JLRjVkkIJf4rSAGxuO92yY7dBJIQtQVOyW+Q+hLLwKwmdrCPadR9F4s38NtrNc9oZ+qT/mvGeQuOeAAjVclMRQc5kggjUI8k84Uj08B2NRVtpUxwLL6fJ9T21vNXDpbWjr5z9dH0D7iNBlpM/YAvTZP05j1qR+hb722dFzmkMGRbheU6x31OHD0rlAgMHPSrRi+x/ZH+lhf6VBCGgg+QkQQH7JbqiHaPewux2OemSSvl ryosuke.yabuki@gmail.com"
end

execute "add export $PATH" do
  user username
  group username
  cwd "/home/#{username}"
  command "echo 'export PATH=/usr/local/bin:$PATH' >> /home/#{username}/.bashrc"
  not_if "grep -q 'export PATH=/usr/local/bin:$PATH' /home/#{username}/.bashrc"
end

# for deploy
directory "/home/#{username}" do
  mode 0755
  owner username
end

directory "/home/#{username}/#{node[:app][:deploy_to]}" do
  mode 0755
  owner username
  group username
end
