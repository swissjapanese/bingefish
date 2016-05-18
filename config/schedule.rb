set :output, 'log/cron_log.log'

every 12.hours do
  runner "TheTvDbApi.refresh_token"
end

every 1.hours do
  runner "TheTvDbApi.update_series"
end
