server '109.234.34.240', user: 'gymer_deploy', port: 22, roles: [:web, :app, :db], primary: true
set :branch, ENV['BRANCH'] || 'develop'
set :nginx_server_name, 'staging.face.gymmer.ru'
