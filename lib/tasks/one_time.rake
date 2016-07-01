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
end
