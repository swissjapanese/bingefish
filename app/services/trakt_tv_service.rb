class TraktTvService
  def self.fetch_popular_shows
    TraktTvApi.popular.each_with_index do |show, n|
      # if show exists, update show ranking
      tvdb_id = show['ids']['tvdb']
      show = Show.find_by tvdb_id: tvdb_id

      if show.nil?
        show = TvDbImporter.get_show tvdb_id
      end

      show.update_attributes popularity_rank: n + 1
    end
  end
end
