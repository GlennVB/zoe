set :stage, :production
role :app, %w{deploy@94.224.26.193}
role :web, %w{deploy@94.224.26.193}
role :db,  %w{deploy@94.224.26.193}

server '94.224.26.193', user: 'deploy', roles: %w{web app}

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }