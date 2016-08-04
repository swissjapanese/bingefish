class SearchResultPresenter
  def self.prepare show
    fanart =
      if show.fanart.present?
        show.fanart.thumb.url
      else
        'http://lorempixel.com/300/169/cats'
      end

    overview =
      if show.overview.present?
        show.overview.truncate(120,
          omission: '... [read more]',
          separator: ' ')
      end

    {
      id: show.id,
      tvdb_id: show.tvdb_id,
      series_name: show.series_name,
      overview: overview,
      fanart: fanart
    }
  end
end
