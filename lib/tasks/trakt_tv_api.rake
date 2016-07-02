namespace :trakt_tv_api do
  desc 'update list of popular shows'
  task update_popular_shows: :environment do
    TraktTvService.delay.fetch_popular_shows
  end
end
