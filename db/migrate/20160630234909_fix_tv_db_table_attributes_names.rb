class FixTvDbTableAttributesNames < ActiveRecord::Migration
  def change
    #shows
    rename_column :shows, :SeriesName, :series_name
    rename_column :shows, :SeriesID, :series_id
    rename_column :shows, :Status, :status
    rename_column :shows, :FirstAired, :first_aired
    rename_column :shows, :Network, :network
    rename_column :shows, :Genre, :genre
    rename_column :shows, :Actors, :actors
    rename_column :shows, :Overview, :overview
    rename_column :shows, :Airs_DayOfWeek, :airs_day_of_week
    rename_column :shows, :Airs_Time, :airs_time
    rename_column :shows, :Rating, :rating
    rename_column :shows, :Runtime, :runtime
    rename_column :shows, :IMDB_ID, :imdb_id

    # #seasons
    rename_column :seasons, :seriesid, :show_id

    # # #episodes
    rename_column :episodes, :seriesid, :show_id
    rename_column :episodes, :seasonid, :season_id
    rename_column :episodes, :EpisodeNumber, :episode_number
    rename_column :episodes, :EpisodeName, :episode_name
    rename_column :episodes, :FirstAired, :first_aired
    rename_column :episodes, :GuestStars, :guest_stars
    rename_column :episodes, :Director, :director
    rename_column :episodes, :Writer, :writer
    rename_column :episodes, :Overview, :overview
    rename_column :episodes, :ProductionCode, :production_code
    rename_column :episodes, :ShowURL, :show_url
    rename_column :episodes, :IMDB_ID, :imdb_id
    rename_column :episodes, :EpImgFlag, :ep_img_flag

    #actors
    rename_column :actors, :SeriesID, :show_id
    rename_column :actors, :Name, :name
    rename_column :actors, :Role, :role
    rename_column :actors, :SortOrder, :sort_order
    rename_column :actors, :Image, :image
  end
end
