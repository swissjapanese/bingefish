namespace :one_time do
  desc 'load csv from show list'
  task import_show_tsv: :environment do
    ActiveRecord::Base.logger = nil
    ShowImporter.import_tsv 'omdbEpisodes.txt'
  end
end
