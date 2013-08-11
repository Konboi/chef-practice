default['nginx']['vhost']['access_log']         = '/var/log/nginx/access.log'
default['nginx']['vhost']['error_log']          = '/var/log/nginx/error.log'
default['nginx']['vhost']['server_name']        = 'example.com'
default['nginx']['vhost']['root']               = '/var/www/html'
default['nginx']['vhost']['basic_authenticate'] = true
default['nginx']['vhost']['upstream_type']      = 'socket'
default['nginx']['vhost']['port']               = 3000
