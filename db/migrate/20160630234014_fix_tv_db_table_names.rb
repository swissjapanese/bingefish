class FixTvDbTableNames < ActiveRecord::Migration
  def up
    rename_table :tvseries, :shows
    rename_table :tvseasons, :seasons
    rename_table :tvepisodes, :episodes
    rename_table :seriesactors, :actors
  end

  def down
    rename_table :shows, :tvseries
    rename_table :seasons, :tvseasons
    rename_table :episodes, :tvepisodes
    rename_table :actors, :seriesactors
  end
end
