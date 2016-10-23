namespace :sock do
  desc 'start the sock-drawer server to manage socket connections'
  task :server do
    Sock::Server.new.start!
  end
end
