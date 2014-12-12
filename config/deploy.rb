# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'zoe'
set :repo_url, 'git@github.com:glennvb/zoe.git'

set :deploy_to, '/home/deploy/zoe'

set :linked_files, %w{config/secrets.yml config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :ssh_options, {
  port: 2222
}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # after :publishing, :restart

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

end