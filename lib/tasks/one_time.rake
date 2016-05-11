namespace :one_time do
  desc 'load csv from show list'
  task populate_location_display_name: :environment do
    ShowImporter.import_tsv 'omdbEpisodes.txt'
  end
end
