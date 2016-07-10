class SearchResultPresenter
  def self.prepare show
    fanart =
      if show.fanart.present?
        show.fanart.thumb.url
      else
        'http://lorempixel.com/300/169/cats'
      end

    {
      tvdb_id: show.tvdb_id,
      series_name: show.series_name,
      overview: show.overview,
      fanart: fanart
    }
  end
end
