class DetailedShowPresenter
  def self.prepare show
    actors = show.actors.map do |actor|
      ActorPresenter.prepare actor
    end

    seasons = show.seasons.map do |season|
      DetailedSeasonPresenter.prepare season
    end

    {
      ids: {
          id: show.id,
          trakt: show.trakt,
          imdb_id: show.imdb_id
        },
      actors: actors,
      season_count: seasons.count,
      seasons: seasons,
      genre: show.genre,
      overview: show.overview,
      images: {
        fanart: show.fanart.url,
        poster: show.poster.url,
        banner: show.banner.url,
        clearart: show.clearart.url,
        logo: show.logo.url
      }
    }
  end
end
