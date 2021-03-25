# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "cpdierp2"
set :repo_url, "https://github.com/george-cpdi/CPDIWEB.git"
set :deploy_to, "/home/serveradmin/cpdierp2"
set :keep_releases, 5
set :format, :pretty
set :log_level, :debug
set :pty, true

