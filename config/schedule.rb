set :output, 'log/cron_log.log'

every 12.hours do
  rake 'tv_db_api:refresh_jwt_token'
end

every 1.hours do
  rake 'tv_db_api:get_lates_updates'
end
