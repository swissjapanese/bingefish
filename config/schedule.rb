set :output, 'log/cron_log.log'

every 12.hours do
  rake 'tv_db_api:refresh_jwt_token'
end
