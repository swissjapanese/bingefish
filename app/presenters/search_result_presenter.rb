class SearchResultPresenter
  def self.prepare show
    {
      tvdb_id: show.tvdb_id,
      series_name: show.series_name,
      overview: show.overview
    }
  end
end
