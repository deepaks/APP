set :application, "APP"
set :repository,  "git://github.com/deepakshivhare/APP.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "74.63.12.173"                          # Your HTTP server, Apache/etc
role :app, "74.63.12.173"                          # This may be the same as your `Web` server
role :db,  "74.63.12.173", :primary => true # This is where Rails migrations will run


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts
 set :deploy_to, "/home/myror/APP" # defaults to "/u/apps/#{application}"
 set :user, "myror"            # defaults to the currently logged in user
 
 


# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end