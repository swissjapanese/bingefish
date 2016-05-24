namespace :tv_db_api do
  desc 'refresh jwt token'
  task refresh_jwt_token: :environment do
    TheTvDbApi.refresh_token
  end
end
