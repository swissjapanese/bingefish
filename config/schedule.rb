set :output, 'log/cron_log.log'

every 12.hours do
  rake 'tv_db_api:refresh_jwt_token'
end

every 1.hours do
  rake 'tv_db_api:get_lates_updates'
end

every 1.hours do
  rake 'trakt_tv_api:update_popular_shows'
end
