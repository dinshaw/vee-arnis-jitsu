set :domain, "veearnisjitsu.com"

if ENV['production']
  set :application, "veearnisjitsu.com"
  # set :mongrel_servers, 1
  # set :mongrel_port, 8000
  # set :rails_env, 'production'
else
  set :application, "stage.veearnisjitsu.com"
  # set :mongrel_servers, 3
  # set :mongrel_port, 8010
  # set :rails_env, 'staging'
end

default_run_options[:pty] = true

# *nix user for ssh from local to server
# need key installed
set :user, 'veearni'

# HostingRails config
set :use_sudo, false # HostingRails users don't have sudo access
set :group_writable, false  # By default, Capistrano makes the release group-writable. don't want this with 
set :chmod755, "app config db lib public vendor script script/* public/disp*"  	# Some files that will need proper permissions

# git config
set :repository, "git@github.com:dinshaw/vee-arnis-jitsu.git "
set :scm, 'git'
set :branch, "master"

set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache

role :app, domain
role :web, domain
role :db,  domain, :primary => true
