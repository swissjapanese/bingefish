namespace :tv_db_api do
  desc 'refresh jwt token'
  task refresh_jwt_token: :environment do
    TheTvDbApi.refresh_token
  end

  desc 'get_lates_updates'
  task get_lates_updates: :environment do
    TheTvDbApi.update_series
  end
end
