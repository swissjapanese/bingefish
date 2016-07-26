namespace :one_time do
  desc 'load csv from show list'
  task import_show_tsv: :environment do
    ActiveRecord::Base.logger = nil
    ShowImporter.import_tsv 'omdbEpisodes.txt'
  end

  desc 'populate tvdb_id from seed'
  task populate_tvdb_id_from_seed: :environment do
    Show.all.each do |show|
      show.update_columns(tvdb_id: show.id)
    end
  end

  desc 'updates from the last 6 months'
  task get_huge_update: :environment do
    from_date = 8.months.ago.to_i
    TheTvDbApi.delay.update_series(from_date)
  end

  desc 'trakt image and popularity seed'
  task trakt_image_and_popularity_seed: :environment do
    250.times do |n|
      puts "Importing top #{100*(n+1)} shows"
      TraktTvApi.popular(100, n + 1).each_with_index do |show, m|
        begin
          tvdb_id = show['ids']['tvdb']
          show = Show.find_by tvdb_id: tvdb_id

          if show.nil?
            show = TvDbImporter.fetch_show tvdb_id
          end

          trakt = TraktTvApi.get_show show.imdb_id

          popularity_rank = (n * 100) + m + 1
          show.update_attributes(
            trakt: trakt['ids']['trakt'],
            popularity_rank: popularity_rank,
            remote_fanart_url: trakt['images']['fanart']['full'],
            remote_clearart_url: trakt['images']['clearart']['full'],
            remote_poster_url: trakt['images']['poster']['full'],
            remote_logo_url: trakt['images']['logo']['full'],
            remote_banner_url: trakt['images']['banner']['full']
            )
          puts "finished importing rank: #{popularity_rank}. sleeping."
          sleep 1
        rescue Exception => ex
          # do nothing
        end
      end

    end
  end
end
