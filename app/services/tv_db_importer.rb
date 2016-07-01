class TvDbImporter
  def self.fetch_show tvdb_id
    # create show if it doesnt exist else update
    details = TheTvDbApi.get_serie tvdb_id
    show = Show.find_by tvdb_id: tvdb_id
    if show.nil?
      show = Show.create(
              tvdb_id: details['id'],
              imdb_id: details['imdbId'],
              title: details['seriesName'],
              plot: details['overview'],
              genre: details['genre'].join[', ']
            )
    else
      show.update_attributes(
          title: details['seriesName'],
          plot: details['overview'],
          genre: details['genre'].join[', ']
        )
    end

    # copy images for show
    # fetch_images tvdb_id

    # get and create seasons for said show
    show.seasons = fetch_episodes tvdb_id
    show.save
  end

  def self.fetch_episodes season_id
    seasons = []
    # get and create seasons for show
    # get and create episodes for said season
    # associate episodes with seasons
  end

  def self.fetch_images tvdb_id
    # upload images to s3
  end

  def self.fetch_actors tvdb_id
  end
end
