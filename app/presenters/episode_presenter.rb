class EpisodePresenter
  def self.prepare episode
    {
      id: episode.id,
      number: episode.episode_number,
      name: episode.episode_name,
      overview: episode.overview,
      director: episode.director,
      writer: episode.writer,
      guest_stars: episode.guest_stars
    }
  end
end
