# Change these

set :application, "gymer-face"
set :repo_url, 'https://github.com/gymer/web-app.git'
set :deploy_to, "/www/#{fetch(:application)}_#{fetch(:stage)}"
set :log_level, :debug
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{tmp/sockets tmp/pids log public/system}

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
