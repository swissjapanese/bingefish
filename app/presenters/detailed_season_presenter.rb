class DetailedSeasonPresenter
  def self.prepare season
    episodes = season.episodes.each do |episode|
      EpisodePresenter.prepare episode
    end

    {
      id: season.id,
      season_number: season.season,
      episode_count: episodes.count,
      episodes: episodes
    }
  end
end
