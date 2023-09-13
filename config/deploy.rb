set :application, "rubycats.com"
set :repo_url, "git@github.com:rubycats-com/rubycats.com.git"
set :branch, ENV["BRANCH"] || "main"
set :deploy_to, "/home/rubycats-com/www/#{fetch(:application)}"

# User systemctl config
set :puma_systemctl_user, fetch(:user)
set :puma_service_unit_name, "puma_#{fetch(:application)}_#{fetch(:stage)}"

append :linked_files, "config/database.yml", 'config/master.key'
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/sessions", "vendor", "storage"

set :keep_releases, 5

set :sidekiq_roles, :background

set :local_base_dir, "config/deploy/server"
