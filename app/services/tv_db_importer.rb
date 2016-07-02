class TvDbImporter
  def self.fetch_show tvdb_id
    details = TheTvDbApi.get_show tvdb_id
    show = Show.find_by tvdb_id: tvdb_id
    show_params =
      {
        id: details['id'],
        tvdb_id: details['id'],
        series_name: details['seriesName'],
        series_id: details['seriesId'],
        status: details['status'],
        first_aired: details['firstAired'],
        network: details['network'],
        runtime: details['runtime'],
        genre: details['genre'].join('|'),
        overview: details['overview'],
        lastupdated: details['lastUpdated'],
        airs_day_of_week: details['airsDayOfWeek'],
        airs_time: details['airsTime'],
        rating: details['rating'],
        imdb_id: details['imdbId'],
        zap2it_id: details['zap2itId'],
        site_rating: details['site_rating'],
        site_rating_count: details['siteRatingCount']
      }

    if show.nil?
      show = Show.create(show_params)
    else
      show.update_attributes(show_params)
    end

    # copy images for show
    # fetch_images tvdb_id

    # get and create seasons for said show
    fetch_seasons tvdb_id
    fetch_actors tvdb_id

    show
  end

  def self.fetch_seasons tvdb_id
    seasons =
      TheTvDbApi.
        get_seasons(tvdb_id)['airedSeasons'].
        map! { |a| a.to_i }.
        sort
    seasons.each do |number|
      season = Season.find_by show_id: tvdb_id, season: number
      if season.nil?
        season = Season.create(show_id: tvdb_id, season: number)
      end

      episodes = TheTvDbApi.get_episodes_by_season(tvdb_id, number)
      episodes.each do |episode_info|
        episode = Episode.find_by(
            show_id: tvdb_id,
            season_id: season.id,
            episode_number: episode_info['airedEpisodeNumber']
          )
        episode_params = {
            show_id: tvdb_id,
            episode_number: episode_info['airedEpisodeNumber'],
            season_id: season.id,
            episode_name: episode_info['episodeName'],
            overview: episode_info['overview'],
            first_aired: episode_info['firstAired']
          }
        if episode.nil?
          Episode.create episode_params
        else
          episode.update_attributes episode_params
        end
      end

    end
  end

  def self.fetch_images tvdb_id
    # upload images to s3
  end

  def self.fetch_actors tvdb_id
    actors = TheTvDbApi.get_actors(tvdb_id)
    return if actors.blank?

    actors.each do |actor_info|
      actor = Actor.find_by show_id: tvdb_id, role: actor_info['role']
      actor_params = {
          show_id: tvdb_id,
          name: actor_info['name'],
          role: actor_info['role'],
          sort_order: actor_info['sortOrder'],
          image: actor_info['image']
        }

      if actor.nil?
        Actor.create actor_params
      else
        actor.update_attributes actor_params
      end
    end
  end
end
