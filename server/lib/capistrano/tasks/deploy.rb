# call an existing task
before :starting, :ensure_user

after :finishing, :start_pm2


# or define in block
namespace :deploy do
  before :starting, :ensure_user do
    #
  end

  after :finishing, :start_pm2 do
    execute "cd /var/www/flash-photograph/current/server && pm2 start 'rails s -p 3000 -e production'"
    execute "echo 'pm2 started' >> /var/www/flash-photograph/current/server/log/pm2.log"
  end
end
