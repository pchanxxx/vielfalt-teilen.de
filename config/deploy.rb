require "bundler/capistrano"
require 'sidekiq/capistrano'

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

server "vielfalt-teilen.de", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "kirsi"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, ""
set :branch, "master"

set :maintenance_template_path, File.expand_path("../recipes/templates/maintenance.html.erb", __FILE__)

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases


namespace :newrelic do
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/newrelic.yml #{release_path}/config/newrelic.yml"
    run "ln -nfs #{shared_path}/config/sidekiq.yml #{release_path}/config/sidekiq.yml"
  end
  after "deploy:finalize_update", "newrelic:symlink"
end

namespace :audio do
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/audio #{release_path}/public/audio"
  end
  after "deploy:finalize_update", "audio:symlink"
end

namespace :deploy do
  desc "build missing paperclip styles"
  task :build_missing_paperclip_styles, :roles => :app do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake paperclip:refresh:missing_styles"
  end

  namespace :assets do
    desc "Copy from vendor"
    task :copy_from_vendor do
      run "mkdir -p #{release_path}/public/assets/tinymce/plugins/jbimages"
      run "cp #{release_path}/vendor/assets/javascripts/tinymce.de.js #{release_path}/public/assets/tinymce.de.js"
      run "cp -R #{release_path}/vendor/assets/javascripts/tinymce/plugins/jbimages/* #{release_path}/public/assets/tinymce/plugins/jbimages"
    end
    after "deploy:assets:precompile", "deploy:assets:copy_from_vendor"
  end
end

# after "deploy:update_code", "deploy:build_missing_paperclip_styles"
