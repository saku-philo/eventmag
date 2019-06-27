server '3.112.155.233', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/hiron/.ssh/id_rsa'